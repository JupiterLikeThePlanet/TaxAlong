class ShiftController < ApplicationController
  include ShiftHelper

  
  def index

    @user = User.find(params[:user_id])

    @shifts = @user.shifts.all
    @expenses = @user.expenses.all

  end

  def show

    @shift = Shift.find(params[:id])
  
  end

  def new

    @shift = Shift.new
  
  end

  def create
    
    @shift = current_user.shifts.new(shift_params)
    p "**" * 100
    # p "start"
    start_m = params["shifts"][:start_mileage]
    end_m = params["shifts"][:end_mileage]
    # p params["shifts"][:start_mileage]
    # p "end"
    # p params["shifts"][:end_mileage]

    integered_start = start_m.to_i
    integered_end = end_m.to_i

    p "integered_start"
    p integered_start
    p integered_start.is_a?(Integer)
    p "integered_end"
    p integered_end
    p integered_end.is_a?(Integer)


    # if end_m.to_i > start_m.to_i
    #   puts true
    # else
    #   puts false
    # end


    p "**" * 100

    # if (params["shifts"][:end_mileage]) > (params["shifts"][:start_mileage])
    # if 
    #   puts "WONT SAVE BECAUSE END MILEAGE IS LESS"
    #   render :new
    if (integered_end < integered_start)
      flash[:danger] = "End mileage is less than start mileage, try again"
      render :new
    elsif (@shift.save!)
      redirect_to user_shift_path(current_user.id, @shift.id)
    else
      render :new
    end
  
  end

  def edit

    @shift = current_user.shifts.find(params[:id])
    
  end

  def update
    start_m = params["shifts"][:start_mileage]
    end_m = params["shifts"][:end_mileage]

    integered_start = start_m.to_i
    integered_end = end_m.to_i

    @shift = current_user.shifts.find(params[:id])
    if (integered_end < integered_start)
      flash[:danger] = "End mileage is less than start mileage, try again"
      render 'edit'
    elsif (@shift.update_attributes(shift_params))
      flash[:success] = "Info updated"
      redirect_to user_shift_path(@shift.user_id, @shift.id)
    else
      flash[:danger] = "Edits did not save, try again"
      render 'edit'
    end

  end

  def destroy

    @shift = current_user.shifts.find(params[:id])
    @shift.destroy
    flash[:success] = "Shift deleted"
    redirect_to user_shift_index_path(current_user)

  end

end

private

def shift_params
  params.require(:shifts).permit(:start_mileage, :end_mileage, :earnings, :date, :id)
end
