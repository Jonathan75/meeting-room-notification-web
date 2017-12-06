class ResetRoomStatusJob
  include SuckerPunch::Job

  def perform(room_id)
    room = Room.find(room_id)
    room.update_attribute(:status, 0)
  end
end
