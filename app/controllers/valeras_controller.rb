class ValerasController < ApplicationController
  def create
  end

  def show
  end

  def index
    if !current_user.valera.nil?
      p current_user.valera.id
    else
      p 'ses'
    end
  end
end
