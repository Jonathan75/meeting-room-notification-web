class RoomsController < ApplicationController
  include ActionController::MimeResponds
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    respond_to do |format|
      format.json do
        update_room_checked_at(Time.now) unless params['web']
        render json: {status: @room.status, status_description: @room.status_description}
      end
      format.html do
        render :edit
      end
    end
  end

  def check
    if params[:ids]
      room_ids = params[:ids].split(',')
      offline = Room.where(id: room_ids).select{|room| room.offline }.size
    else
      offline = Room.all.select{|room| room.offline }.size
    end
    respond_to do |format|
      format.json do
        render json: {status: offline == 0 ? 0: 1}
      end
      format.html do
        redirect_to rooms_path
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
      if @room.offline
        flash[:notice] = 'The room status light is currently offline.'
      else
        flash[:success] = friendly_message
      end
      render :edit
    else
      flash[:error] = 'unable to change status'
      render :edit
    end
  end

  private

  def update_room_checked_at(time)
    @room.update_attributes! checked_at: time
  end


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
