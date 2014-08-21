require 'spec_helper'
require 'pry'

describe Event do
  it { should validate_presence_of :description }
  it { should validate_presence_of :location }
  it { should validate_presence_of :start_date}
  it { should validate_presence_of :end_date}

  it 'lists out events in order of soonest' do
    event1 = Event.create({description: "Get breakfast", location: "home", start_date: '23rd Aug 2014 12:00:00', end_date: '14th Sep 2014 12:00:00'})
    event2 = Event.create({description: "Get lunch", location: "work", start_date: '20rd Aug 2015 12:00:00', end_date: '14th Nov 2015 12:00:00'})
    event3 = Event.create({description: "Get dinner", location: "restaurant", start_date: '20rd Mar 2015 12:00:00', end_date: '14th Apr 2015 12:00:00'})
    expect(Event.list_order).to eq [event1, event3, event2]
  end

  it 'only lists future events' do
    event1 = Event.create({description: "Get breakfast", location: "home", start_date: '23rd Aug 2013 12:00:00', end_date: '14th Sep 2013 12:00:00'})
    event2 = Event.create({description: "Get lunch", location: "work", start_date: '20rd Aug 2015 12:00:00', end_date: '14th Nov 2015 12:00:00'})
    event3 = Event.create({description: "Get dinner", location: "restaurant", start_date: '20rd Mar 2012 12:00:00', end_date: '14th Apr 2012 12:00:00'})
    expect(Event.list_order).to eq [event2]
  end

  # it 'returns a list of events for the current day' do
  #   event = Event.create({description: "Get lunch", location: "work", start_date: '21st Aug 2014 12:00:00', end_date: '21st Aug 2014 14:00:00'})
  #   time = 'today'
  #   event.list_order
  #   expect(event.current_events(time)).to eq [event]
  # end

end
