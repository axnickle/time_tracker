#sessions_controller.rb

def create
  user = User.where(username: params[:username]).first
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id # important to only store userid in cookie(session) and not other information of the user to not have too big a cookie and risk "cookie overflow".
    flash[:notice] = "Welcome, you've logged in."
    redirect_to root_path
  else
    flash[:error] = "There is something wrong with your username or password."
    redirect_to login_path
  end
end

def destroy
  session[:user_id] = nil # all that's necessary to end the session (set session user_id to nil)
  flash[:notice] = "You've logged out."
  redirect_to root_path
end
