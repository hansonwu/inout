class HomeController < ApplicationController
    
  def index
    if user_signed_in?
      flash.keep(:notice)
      redirect_to board_path
    end
  end
end
