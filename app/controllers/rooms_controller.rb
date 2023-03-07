require "rqrcode"

class RoomsController < ApplicationController
  before_action :set_question, only: [:show_main]
  before_action :set_room, only: [:show_main, :show_player, :question_options, :selected_answer, :player_ready]

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
    @room.change_questioner

    start_quiz
  end

  def show_player
    @player = Player.find_by(id: session[:player_id])
  end

  def question_options
    @room.reset_players_answered
    correct_answer = params[:correct_answer]
    @room.questioner.update(answer: correct_answer)

    ActionCable.server.broadcast "room_channel_#{@room_id}", {
      action: 'get ready',
    }
    sleep(3)
    @room.update(question_start_time: Time.now)
    ActionCable.server.broadcast "room_channel_#{@room_id}", {
      correct_answer: @room.questioner.answer,
      question_options: random_order_options,
      questioner: @room.questioner.name,
      action: 'select answer',
    }
    return nil
  end

  def selected_answer
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
    if @room.everyone_answered?
      @room.give_points
      ActionCable.server.broadcast "room_channel_#{@room_id}", {
        action: 'everyone has answered',
      }
    end

    return nil
  end

  def player_ready
    player = @room.players.find_by(name: params[:player_ready])
    player.update(ready: true)

    ActionCable.server.broadcast "room_channel_#{@room_id}", {
      player_ready: params[:player_ready],
      action: 'player ready',
    }

    if @room.everyone_ready?
      start_quiz
    end

    return nil
  end

  def new_player_url
    "#{request.protocol}#{request.remote_ip}:#{request.domain}#{request.port}/players/new/#{@room.room_id}"
  end

  private

  def random_order_options
    params[:correct_answer] + ',' + params[:incorrect_answers].split(',').filter(&:present?).map(&:strip).shuffle.join(',')
  end

  def start_quiz
    set_question
    set_room
    ActionCable.server.broadcast "room_channel_#{@room_id}", {
      question: @question.question_for(@room.questioner.name),
      options: @question.options,
      questioner: @room.questioner.name,
      incorrect_answer_limit: @question.incorrect_answers,
      action: 'start quiz',
    }
    @room.reset_players_ready_status
  end

  def room_params
    params.require(:room).permit(:name, :room_id)
  end

  def set_room
    @room_id = params[:room_id]
    @room = Room.find_by(room_id: @room_id)
  end

  def set_question
    count = Question.all.count
    random_offset = rand(count)
    @question = Question.all.offset(random_offset).limit(1).first
  end
end
