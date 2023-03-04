class PlayersController < ApplicationController
  def new
    @player = Player.new
    @room = Room.find_by(room_id: params[:room_id])
  end

  def create
    @room = Room.find_by(room_id: player_params[:room_id])
    @player = Player.new(player_params.merge(room: @room))

    if @player.save
      session[:player_id] = @player.id
      players_names = @room.players.pluck(:name)
      ActionCable.server.broadcast "room_channel_#{@room_id}", {players: players_names}
      redirect_to room_show_player_path(room_id: @room.room_id)
    else
      render :new
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :room_id, :colour, :avatar)
  end
end
