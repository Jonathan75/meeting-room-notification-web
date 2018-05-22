class AddRoomCheck < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :checked_at, :datetime, null: false, :default => Time.now
  end
end
