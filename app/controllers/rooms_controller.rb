class RoomsController < ApplicationController
  include ActionController::MimeResponds
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    respond_to do |format|
      format.json do
        render json: {status: @room.status}
      end
      format.html do
        render :edit
      end
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)
      ResetRoomStatusJob.perform_in(30, @room.id)
      flash[:success] = friendly_message
      render :edit
    else
      flash[:error] = 'unable to change status'
      render :edit
    end
  end

  private

  def room_params
    params.require(:room).permit!
  end

  def friendly_message
    case @room.status
      when 1
        'Room occupants have been notified you are waiting.'
      when 2
        'Room occupants have been notified they are out of time.'
      when 3
        'Room occupants have been notified they need to leave.'
    end
  end

end
