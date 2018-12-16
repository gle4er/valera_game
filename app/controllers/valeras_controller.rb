class ValerasController < ApplicationController
  before_action :authenticate_user!

  def create
    #current_user.valera.skill = ???
  end

  def new
    if current_user.valera.nil?
      current_user.create_valera
    end
    @valera = current_user.valera
  end

  def show
    @valera = current_user.valera
    if @valera.nil? or @valera.skill = ''
      redirect_to action: 'new'
    end
    @valera = current_user.valera
  end

end
