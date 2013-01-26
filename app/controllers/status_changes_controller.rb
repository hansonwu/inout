class StatusChangesController < ApplicationController
  
  before_filter :authenticate_user!
  
  def board
    # Grab current user status information, set up new status change
    @current_user_is_in = current_user.is_in
    @status = @current_user_is_in ? nil : current_user.current_status.status
    @status_change = StatusChange.new
    
    @users = User.all(include: :current_status, order: "users.name ASC")
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
      # Render the board again with error information
      @current_user_is_in = current_user.is_in
      @users = User.all(include: :current_status, order: "users.name ASC")
      render 'board'
    end
  end
  
end
