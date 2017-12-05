class Room < ActiveRecord::Base
  validates :name, presence: true
  validates :status, presence: true
end
