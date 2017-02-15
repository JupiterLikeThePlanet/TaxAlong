class ShiftController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    # //User.find_by(params[:user_id]) or User.find(params[:id]) ???
    @shifts = @user.shifts.all
    # @shifts = Shift.all
  end

  def show
    # @user = User.find(params[:user_id])
    @shift = Shift.find(params[:id])
    # @shift = @user.shifts[shift]
  end

  def new
    @shift = Shift.new
  end

  def create
    p "Create controlllllller !@#E$@"
    # @user = User.find(params[:id])
    # @shift = @user.shifts.create(shift_params)

    @shift = current_user.shifts.new(:start_mileage => params["shifts"][:start_mileage], :end_mileage => params["shifts"][:end_mileage], :earnings => params["shifts"][:earnings])

    # Shift.new(:start_mileage => params["shifts"][:start_mileage], :end_mileage => params["shifts"][:end_mileage], :earnings => params["shifts"][:earnings])

    # @shift = Shift.new(shift_parameters)

    if @shift.save!
      # redirect_to user_shift_path(@user.id, @shift.id)
      p "+"*90
      p "if statement"
      p "+"*90
      byebug
      redirect_to user_shift_path(current_user.id, @shift.id)


    else
      p "*"*90
      p "else statement"
      p "*"*90
      byebug

      # logger.debug @shift.errors.full_messages.join(", ")
      # flash[:danger] = "User did not save, try again"
      # render 'new_user_shift_path(@user.id)'
      render :new
    end
  end

  def edit
    @shift = Shift.find(params[:id])
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
