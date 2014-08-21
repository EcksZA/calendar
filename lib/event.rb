class Event < ActiveRecord::Base

  def edit_description new_description
    self.update({:description => new_description})
  end
end
