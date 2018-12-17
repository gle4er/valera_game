class EventsController < ApplicationController

  def new
    @event_list = Event.all
  end

  def create
  end

end
