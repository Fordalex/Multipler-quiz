class RoomsController < ApplicationController
  def show
    @room_id = params[:id]
    @room = Room.find_or_create_by(room_id: @room_id)
  end

  def add_user
    @room_id = params[:id]
    @room = Room.find_or_create_by(room_id: @room_id)
    name = params[:name]

    players_names = @room.players.pluck(:name) << name
    ActionCable.server.broadcast "room_channel_5", {players: players_names}
    player = Player.new(name: params[:name], room: @room)

    if player.save!
      redirect_to room_path(id: @room_id)
    else
      redirect_to root_path
    end
  end

  private

  def room_params
    # params.require(:room).permit(:name)
  end
end
