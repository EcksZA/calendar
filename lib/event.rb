class Event < ActiveRecord::Base
  validates :description, :presence => true
  validates :location, :presence => true
end
