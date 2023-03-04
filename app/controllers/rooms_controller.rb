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
      module_size: 11,
      standalone: true,
      use_path: true
    )
  end

  def show_main
    @room_id = params[:room_id]
    @room = Room.find_or_create_by(room_id: @room_id)

    ActionCable.server.broadcast "room_channel_#{@room_id}", {
      question: @question.question,
      options: @question.options,
      questioner: @room.players.sample.name
    }
  end

  def show_player
    @player = Player.find_by(id: session[:player_id])
    @room_id = params[:room_id]
    @room = Room.find_or_create_by(room_id: @room_id)
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
