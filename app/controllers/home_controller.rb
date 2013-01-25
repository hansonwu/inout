class HomeController < ApplicationController
    
  def index
    if user_signed_in?
      redirect_to board_path
    end
  end
end
