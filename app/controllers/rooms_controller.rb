class RoomsController < ApplicationController
  def show
    room = Room.find(params[:id])
    render plain: room.status
  end
end
