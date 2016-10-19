class UserController < ApplicationController

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
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
  end

  def edit
    # @user = current_user
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
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
