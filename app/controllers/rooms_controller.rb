require "rqrcode"

class RoomsController < ApplicationController
  before_action :set_question, only: [:show_main]

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.room_id = SecureRandom.hex(10)

    if @room.save
      redirect_to room_lobby_path(room_id: @room.room_id)
    else
      render :new
    end
  end

  def lobby
    @room = Room.find_by(room_id: params[:room_id])
    @new_player_url = new_player_url
    qrcode = RQRCode::QRCode.new(@new_player_url)
    @QRCSVG = qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 5,
      standalone: true,
      use_path: true
    )
  end

  def show_main
    @room_id = params[:room_id]
    @room = Room.find_by(room_id: @room_id)
    @room.change_questioner

    ActionCable.server.broadcast "room_channel_#{@room_id}", {
      question: @question.question_for(@room.questioner.name),
      options: @question.options,
      questioner: @room.questioner.name,
      action: 'start quiz',
    }
  end

  def show_player
    @player = Player.find_by(id: session[:player_id])
    @room_id = params[:room_id]
    @room = Room.find_by(room_id: @room_id)
  end

  def question_options
    @room_id = params[:room_id]
    @room = Room.find_by(room_id: @room_id)
    @room.reset_players_answered
    @room.update(question_start_time: Time.now)
    @room.questioner.update(answer: params[:question_options].split(',').last)
    random_order_options = params[:question_options].split(',').shuffle.join(',')

    ActionCable.server.broadcast "room_channel_#{@room_id}", {
      correct_answer: @room.questioner.answer,
      question_options: random_order_options,
      questioner: @room.questioner.name,
      action: 'select answer',
    }
    return nil
  end

  def selected_answer
    @room_id = params[:room_id]
    @room = Room.find_by(room_id: @room_id)
    player_answered = @room.players.find_by(name: params[:player_answered])
    player_answered.update(answer: params[:selected_answer])
    time_taken_to_answer = Time.now - @room.question_start_time
    player_answered.update(time_taken_to_answer: time_taken_to_answer)

    ActionCable.server.broadcast "room_channel_#{@room_id}", {
      player_answered: params[:player_answered],
      selected_answer: params[:selected_answer],
      time_taken_to_answer: time_taken_to_answer,
      action: 'player answered'
    }
    @room.give_points if @room.everyone_answered?

    return nil
  end

  def new_player_url
    "#{request.protocol}#{request.remote_ip}:#{request.domain}#{request.port}/players/new/#{@room.room_id}"
  end

  private

  def room_params
    params.require(:room).permit(:name, :room_id)
  end

  def set_question
    count = Question.count
    random_offset = rand(count)
    @question = Question.offset(random_offset).limit(1).first
  end
end
