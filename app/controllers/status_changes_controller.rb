class StatusChangesController < ApplicationController
  
  before_filter :authenticate_user!
  
  def board
    @status = StatusChange.new
  end
  
  def log
    
  end
  
  def create
    
  end
end
