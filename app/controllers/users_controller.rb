class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before the action runs, set user
  # for the above actions, we have to have a user to work with

  def show # /users/3
    @user = User.find(params[:id])
  end

  def index # user's index can be navigaged from the nav bar
    @users = User.all
  end

  def new #adding @user variable to the 'new' action
    @user = User.new
  end

  def edit
    @user = User.find params[:id]
  end

  def update #enable 'edit'be saved; in edit.html.erb
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create #this could also be 'def new'
    #@user = User.new(user_params) #will find users based on paras
      @user = User.new(user_params) #using strong params in the 'create' action
    if @user.save
      session[:user_id] = @user.id # to automatically login a user that signed up
      flash[:notice] = "You are registered!"
      redirect_to @user #or root_path # the user 'create' action with a save and a redirect
    else
      render :new
    end
  end

  private # no public access to parameters

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def set_user # set_user method
    @user = User.find(params[:id])
  end

end
