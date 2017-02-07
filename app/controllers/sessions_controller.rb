class SessionsController < ApplicationController
  

  def new
  end

  def create
    @user = User.find_by(email: params[:sessions][:email])
    if @user && @user.authenticate(params[:sessions][:password])
       log_in @user
       redirect_to user_url(@user)
    else
      # flash[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
