class RoomsController < ApplicationController
  include ActionController::MimeResponds
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @room.update_attribute(:status, 0) if @room.updated_at < 30.seconds.ago

    respond_to do |format|
      format.json do
        render json: {status: @room.status, status_description: @room.status_description}
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
      flash[:success] = friendly_message
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
