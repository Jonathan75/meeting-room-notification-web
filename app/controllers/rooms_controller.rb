class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    room = Room.find(params[:id])
    room.update_attribute(:status, 0) if room.updated_at < 30.seconds.ago
    render json: {status: room.status}
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)
      flash[:success] = 'Room was updated successfully.'
      render :edit
    else
      flash[:error] = 'unable to change status'
      render :edit
    end
  end

  def reset
    @room = Room.find(params[:id])
    @room.update_attribute(:status, 0)
  end

  private

  def room_params
    params.require(:room).permit!
  end

end
