class Room < ActiveRecord::Base
  validates :name, presence: true
  validates :status, presence: true

  def status_description
    case status
      when 0
        "Not Set"
      when 1
        'Waiting 👋🏼'
      when 2
        'Times up! 😡'
      when 3
        'Urgent!! 😫'
    end
  end
end
