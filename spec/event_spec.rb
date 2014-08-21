require 'spec_helper'

describe Event do
  it 'validates the presence of an event description' do
    event1 = Event.create({:description => ""})
    event2 = Event.create({:description => "Figure out what's for lunch"})
    expect(event1.save).to eq false
    expect(event2.save).to eq true
  end

end
