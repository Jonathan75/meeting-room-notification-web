class UpdateRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :description, :string
    change_column :rooms, :name, :string, null: false
    change_column :rooms, :status, :integer, null: false
  end
end
