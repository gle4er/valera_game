class ValerasController < ApplicationController
  def create
    current_user.create_valera
    #current_user.valera.skill = ???
  end

  def show
  end

  def index
    if !current_user.valera.nil?
      redirect_to :action => 'show', :user_id => current_user.id
    else
      p current_user
    end
  end
end
