class ValerasController < ApplicationController
  before_action :authenticate_user!

  def create

    #current_user.valera.skill = ???
  end

  def show
    if current_user.valera.nil?
      current_user.create_valera
    end
    @valera = current_user.valera
  end

end
