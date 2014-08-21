require 'spec_helper'

describe Event do
  it { should validate_presence_of :description }
  it { should validate_presence_of :location }
  it { should validate_presence_of :start_date}
  it { should validate_presence_of :end_date}

  it 'lists out events in order of soonest' do
    event1 = Event.create({description: "Get lunch", location: "work", start_date: '23rd Aug 2014 12:00:00', end_date: '14th Sep 2014 12:00:00'})
    event2 = Event.create({description: "Get lunch", location: "work", start_date: '20rd Aug 2015 12:00:00', end_date: '14th Nov 2015 12:00:00'})
    event3 = Event.create({description: "Get lunch", location: "work", start_date: '20rd Mar 2015 12:00:00', end_date: '14th Apr 2015 12:00:00'})
    expect(Event.list_order).to eq [event1, event3, event2]
  end
end
