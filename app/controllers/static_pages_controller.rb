class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to controller: 'valeras', action: 'index'
    end
  end

  def help
  end
end
