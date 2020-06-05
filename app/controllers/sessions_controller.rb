class SessionsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #set up similarly to users_controller.rb
  def new
  end

  def create #when logging in, it calls this method
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      #session[:user_id] = user.id # important to only store userid in cookie(session) and not other information of the user to not have too big a cookie and risk "cookie overflow".
      log_in(user) #calling line 5 in sessions helper; () optional
      #params[:remember_me] == '1' ? remember(user) : forget(user)
      flash[:notice] = "Welcome, you've logged in."
      # after login, direct user to the customers index
      redirect_back_or customers_path #user should be able to start log in time after logging in
      #redirect_to root_path
    else
      flash[:error] = "There is something wrong with your email or password."
      redirect_to login_path
    end
  end
end

  def destroy
    session[:user_id] = nil # all that's necessary to end the session (set session user_id to nil)
    log_out # calling the log_out method from sessions_helper
    flash[:notice] = "You've logged out."
    redirect_to root_path
  end

  # handles login page
  # line 10 in sessions controller = line 5 in sessions helper
