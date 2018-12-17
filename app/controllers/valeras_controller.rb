class ValerasController < ApplicationController
  before_action :authenticate_user!

  def new
    @cur_valera = current_user.valera
    if @cur_valera.nil? or @cur_valera.skill == ''
      @skills = ['workoholic', 'elon', 'dragon', 'medic']
      @valera = Valera.new
    else
      redirect_to action: 'show'
    end
  end

  def create
    if current_user.valera.nil?
      current_user.create_valera
    end
    current_user.valera.skill = params["valera"]["skill"]
    current_user.valera.save
    redirect_to action: 'show'
  end

  def update
    p current_user.valera.skill
  end

  def show
    @valera = current_user.valera
    if @valera.nil? or @valera.skill == ''
      redirect_to action: 'new'
    end
  end

end
