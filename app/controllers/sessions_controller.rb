class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] =  "You have successfully logged in."
      redirect_to user_path(@user)
    else
      flash[:notice] = "Your username or password is incorrect."
      render 'new'
  end
end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to new_session_path
  end


end