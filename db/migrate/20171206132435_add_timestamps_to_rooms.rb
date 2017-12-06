class AddTimestampsToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :created_at, :datetime
    add_column :rooms, :updated_at, :datetime
  end
end
