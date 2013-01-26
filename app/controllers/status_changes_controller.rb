class StatusChangesController < ApplicationController
  
  before_filter :authenticate_user!
  
  def board
    @current_user_is_in = current_user.is_in
    @status = @current_user_is_in ? nil : current_user.current_status.status
    # Pass the unsuccessful status change to view if needed
    @status_change = StatusChange.new
  end
  
  def log
    
  end
  
  def create
    @status_change = current_user.status_changes.build(params[:status_change])
    @status_change.in = !current_user.is_in
    if @status_change.save
      flash[:success] = "Your status was successfully changed."
      redirect_to board_path
    else
      @current_user_is_in = current_user.is_in
      render 'board'
    end
  end
end
