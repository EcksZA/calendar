require 'spec_helper'

describe Event do
  it "allows for the editing of an event" do
    event_1 = Event.create({:description => "Figure out what I'm doing"})
    event_1.edit_description("Figure out what's for lunch")
    expect(event_1.description).to eq "Figure out what's for lunch"
  end

end
