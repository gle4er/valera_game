class EventsController < ApplicationController

  def new
    @event_list = Event.all
  end

  def create
    @event = Event.find params["id"]
    @stats = @event.stats
    p @stats
    @stats.each do |stat, value|
      unless value.nil?
        new_value = current_user.valera.send(stat.to_s)
        new_value += value
        current_user.valera.send(stat.to_s + '=', new_value)
      end
    end
    current_user.valera.save
  end

end
