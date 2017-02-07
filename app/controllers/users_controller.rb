class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :password => params[:password])
    if @user.save
      log_in @user
      # flash[:success] = "You're ready to TaxAlong!"
      # redirect_to user_url(@user)
      redirect_to users_path(@user)
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
end