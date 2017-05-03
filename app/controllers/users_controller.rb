class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @shifts = @user.shifts

    @time = Time.new
    @month = @time.strftime("%m").to_i
  end

  def new
    @user = User.new
    p "**" * 100
    p @user
    p "**" * 100
  end

  def create

    p "**" * 100
    p @user
    p "**" * 100
    
    # @user = User.new(:first_name => params["user"][:first_name], :last_name => params["user"][:last_name], :email => params["user"][:email], :password => params["user"][:password])
    @user = User.new(user_params)

    if @user.save!
      log_in @user
      # flash[:success] = "You're ready to TaxAlong!"
      # redirect_to user_url(@user)
      redirect_to user_path(@user)
    else
      # flash[:danger] = "User did not save, try again"
      render 'new'
    end
  end

  def edit
    # @user = current_user
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params)
      # flash[:success] = "Info updated"
      redirect_to user_url(@user)
    else
      # flash[:danger] = "Edits did not save, try again"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    # flash[:success] = "User deleted"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, shift_attributes: [:start_mileage, :end_mileage, :earnings, :date, :id])
  end


end

