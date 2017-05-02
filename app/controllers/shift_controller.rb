class ShiftController < ApplicationController
  include ShiftHelper

  
  def index
    @user = User.find(params[:user_id])
    # //User.find_by(params[:user_id]) or User.find(params[:id]) ???
    # @shifts = @user.shifts.all

    @shifts = @user.shifts.all
    @expenses = @user.expenses.all
    # @shifts = [@all_shifts, @expenses]
    # @events = [@shifts, @expenses]

  end

  def show
    @shift = Shift.find(params[:id])
    # @current_shift = @shift.id
    # log_shift(@shift)
    # p "$"*90
    # p "current shift in show shift"
    # p @current_shift
    # p "$"*90
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = current_user.shifts.new(shift_params)
    ####
    # @shift = current_user.shifts.new(:start_mileage => params["shifts"][:start_mileage], :end_mileage => params["shifts"][:end_mileage], :earnings => params["shifts"][:earnings])
    ###

    if @shift.save!
      redirect_to user_shift_path(current_user.id, @shift.id)
    else
      render :new
    end
  end

  def edit
    @shift = current_user.shifts.find(params[:id])
    # @shift = Shift.find(params[:id])
  end

  def update
    @shift = Shift.find(params[:id])
    if @shift.update_attributes(shift_params)
      flash[:success] = "Info updated"
      redirect_to shift_url(@shift)
    else
      flash[:danger] = "Edits did not save, try again"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @shift = Shift.find(params[:id])
    @shift.destroy
    flash[:success] = "Shift deleted"
    redirect_to user_url(@user)
  end

end

private

def shift_params
  params.require(:shifts).permit(:start_mileage, :end_mileage, :earnings, :date)
end
