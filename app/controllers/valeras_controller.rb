class ValerasController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.create_valera
    #current_user.valera.skill = ???
  end

  def show
  end

  def index
    if !current_user.valera.nil?
      redirect_to action: 'show'
    else
      p current_user
    end
  end
end
