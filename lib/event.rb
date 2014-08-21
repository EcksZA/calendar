require 'pry'

class Event < ActiveRecord::Base
  validates :description, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true


  def self.list_order
    new_list = Event.all.reject {|event| event.start_date <= Date.today}
    new_list.sort_by(&:start_date)
    # binding.pry
    # Event.where("start_date =? ASC")
  end


end

