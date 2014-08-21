class Event < ActiveRecord::Base
  validates :description, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
