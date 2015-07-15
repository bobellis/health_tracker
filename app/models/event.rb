class Event < ActiveRecord::Base
  belongs_to :user
  has_many :sources

  scope :created_on, ->(date, user_id) {where("event_date = ?", date && "user_id = ?", user_id)
  }

end
