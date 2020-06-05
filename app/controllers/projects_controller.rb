class ProjectsController < ApplicationController
  #before_action :set_user, only: [:show, :edit, :update, :destroy]

  # url projects/1
  def show
    puts "***** #{params}" #is this showing up in this controller?
    @project = Project.find params[:id] #@project is the available for the view
  end

  def index
    @projects = Project.all #pulling projects out of Project model
  end

  def new
    @project = Project.new # after user complete form in new.html.erb, this will create new input
    @customers = Customer.all
  end

  def edit # enables edit for projects
    @project = Project.find params[:id]
  end

  def update # should enable 'edit' to be saved; in edit.html.erb
    @project = Project.find(params[:id])
      if @project.update(project_params)
        flash[:success] = "Project updated!"
        redirect_to @project
      else
        render 'edit'
      end
    end

  end

  def create #this could also be 'def new'?
    puts params
      # getting parameters the user is entering, this info gets
      # passed to the Customer controller; takes attrbutes and makes new customer
      @project = Project.new(project_params) #using strong params in the 'create' action
    if @project.save
      flash[:notice] = "Project created!"
      redirect_to @project #or root_path # the user 'create' action with a save and a redirect
    else
      render :new #if there's a problem creating the new customer
    end
  end

  private # no public access to parameters

  def project_params
    params.require(:project).permit(:project_name, :customer_id)
  end




# want just the project id
