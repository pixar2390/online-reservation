class ReservationsController < ApplicationController

  def index
    if current_user.id < 2 thhen
      render_to redirect_to  edit_reservation_path(@group.id)
    end

  end

  def show
    
  end

  def new
    
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private



end
