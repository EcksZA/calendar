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

  def self.current_events time, reference
    case time
    when 'today'
      case reference
      when 'current'
        new_list = Event.all.reject { |event| event.start_date.to_date != Date.today}
      when 'previous'
        new_list = Event.all.reject { |event| event.start_date.to_date != Date.today-1}
      end
    when 'week'
      case reference
      when "current"
        new_list = Event.all.reject do |event|
          (event.start_date.to_date < Date.today) || (event.start_date.to_date > (Date.today+6))
        end
      when "previous"
        new_list = Event.all.reject do |event|
          (event.start_date.to_date >= Date.today) || event.start_date.to_date <= Date.today-6
        end
      end
    when 'month'
      case reference
      when "current"
        new_list = Event.all.reject do |event|
          event.start_date.to_date < Date.today || event.start_date.to_date > Date.today.next_month
        end
      when "previous"
        new_list = Event.all.reject do |event|
          event.start_date.to_date >= Date.today || event.start_date.to_date < Date.today.prev_month
        end
      end
    end
    new_list.sort_by(&:start_date)
  end

end

