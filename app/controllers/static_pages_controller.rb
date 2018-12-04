class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      p current_user
      redirect_to :controller => 'users', :action => 'index'
    end
  end

  def help
  end
end
