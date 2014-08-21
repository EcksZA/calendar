class Event < ActiveRecord::Base
  validates :description, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true


  def self.list_order
    Event.all.reject {|event| event.start_date <= Date.today}
    Event.all.sort_by(&:start_date)
  end


end

