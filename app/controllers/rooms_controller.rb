require "rqrcode"

class RoomsController < ApplicationController
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
    qrcode = RQRCode::QRCode.new("#{request.protocol}#{request.domain}:3000/players/new/#{@room.room_id}")
    @QRCSVG = qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true
    )

  end

  def show_main
    @room_id = params[:id]
    @room = Room.find_or_create_by(room_id: @room_id)
  end

  def show_player
    @room_id = params[:id]
    @room = Room.find_or_create_by(room_id: @room_id)
  end

  private

  def room_params
    params.require(:room).permit(:name, :room_id)
  end
end
