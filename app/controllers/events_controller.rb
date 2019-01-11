class EventsController < ApplicationController

  before_action :authenticate_user!

  before_action do |controller|
    @valera = current_user.valera
  end


  def new

    if @valera.is_out?
      @wait_time = @valera.out_time - Time.now.utc
      flash[:notice] = "Warning: Valera still busy. Wait for #{@wait_time}"
      redirect_to controller: 'valeras', action: 'show'
    end
    @event_list = Event.all
    @event_print = Event.all
  end

  def create
    @event = Event.find params["id"]
    @stats = @event.stats
    if !@event.money.nil? && @valera.money < -@event.money && @event.money < 0
      flash[:alert] = "Not enough money"
      redirect_to action: 'new'
      return
    end
    @stats.each do |stat, value|
      unless value.nil?
        new_value = @valera.send(stat.to_s)
        new_value += value
        @valera.send(stat.to_s + '=', new_value)
      end
    end
    @valera.out_time = Time.now.utc + @event.duration
    @valera.save
    redirect_to controller: 'valeras', action: 'show'
  end

end
