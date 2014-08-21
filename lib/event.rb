require 'pry'

class Event < ActiveRecord::Base
  validates :description, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true


  def self.list_order
    new_list = Event.all.reject {|event| event.start_date <= Date.today}
    new_list.sort_by(&:start_date)
  end

  def current_events time
    case time
    when 'today'
      new_list = Event.all.reject { |event| event.start_date.to_date != Date.today}
    # when 'week'
    # when 'month'
    end
    new_list
  end

end

