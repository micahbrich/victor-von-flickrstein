class SessionsController < ApplicationController
  def new
  end
  
  def create
    session[:password] = params[:password]
    if session[:password] == @password
      flash[:notice] = "Successfully logged in"
      redirect_to root_path
    else
      flash[:notice] = "Sorry, wrong password!"
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = "Successfully logged out"
    redirect_to login_path
  end
end
