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

  it 'returns a list of events for the current day' do
    event = Event.create({description: "Get lunch", location: "work", start_date: '21st Aug 2014 12:00:00', end_date: '21st Aug 2014 14:00:00'})
    time = 'today'
    reference = "current"
    expect(Event.current_events(time, reference)).to eq [event]
  end

  it 'returns a list of events for the current week' do
    event1 = Event.create({description: "Get lunch", location: "work", start_date: '21st Sep 2014 12:00:00', end_date: '21st Sep 2014 14:00:00'})
    event2 = Event.create({description: "Get lunch", location: "work", start_date: '21st Aug 2014 12:00:00', end_date: '21st Aug 2014 14:00:00'})
    event3 = Event.create({description: "Get lunch", location: "work", start_date: '26th Aug 2014 12:00:00', end_date: '27th Aug 2014 14:00:00'})
    time = "week"
    reference = "current"
    expect(Event.current_events(time, reference)).to eq [event2, event3]
  end

  it 'returns a list of events for the current month' do
    event1 = Event.create({description: "Get lunch", location: "work", start_date: '20th Sep 2014 12:00:00', end_date: '20th Sep 2014 14:00:00'})
    event2 = Event.create({description: "Get lunch", location: "work", start_date: '21st Aug 2014 12:00:00', end_date: '21st Aug 2014 14:00:00'})
    event3 = Event.create({description: "Get lunch", location: "work", start_date: '26th Nov 2014 12:00:00', end_date: '27th Nov 2014 14:00:00'})
    time = "month"
    reference = "current"
    expect(Event.current_events(time, reference)).to eq [event2, event1]
  end

  it 'returns a list of events for the previous day' do
    event1 = Event.create({description: "Get lunch", location: "work", start_date: '20th Aug 2014 12:00:00', end_date: '20st Aug 2014 14:00:00'})
    event2 = Event.create({description: "Get breakfast", location: "bumblekiss", start_date: '21st Aug 2014 12:00:00', end_date: '23rd Aug 2014 14:00:00'})
    time = 'today'
    reference = "previous"
    expect(Event.current_events(time, reference)).to eq [event1]
  end

  it 'returns a list of events for the previous week' do
    event1 = Event.create({description: "Get lunch", location: "work", start_date: '21st Sep 2014 12:00:00', end_date: '21st Sep 2014 14:00:00'})
    event2 = Event.create({description: "Get lunch", location: "work", start_date: '20th Aug 2014 12:00:00', end_date: '20th Aug 2014 14:00:00'})
    event3 = Event.create({description: "Get lunch", location: "work", start_date: '17th Aug 2014 12:00:00', end_date: '18th Aug 2014 14:00:00'})
    time = "week"
    reference = "previous"
    expect(Event.current_events(time, reference)).to eq [event3, event2]
  end

  it 'returns a list of events for the previous month' do
    event1 = Event.create({description: "Get lunch", location: "work", start_date: '26th Jul 2014 12:00:00', end_date: '26th Jul 2014 14:00:00'})
    event2 = Event.create({description: "Get lunch", location: "work", start_date: '21st Aug 2014 12:00:00', end_date: '21st Aug 2014 14:00:00'})
    event3 = Event.create({description: "Get lunch", location: "work", start_date: '26th Aug 2014 12:00:00', end_date: '27th Aug 2014 14:00:00'})
    time = "month"
    reference = "previous"
    expect(Event.current_events(time, reference)).to eq [event1]
  end


end
