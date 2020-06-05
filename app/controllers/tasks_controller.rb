class TasksController < ApplicationController

  # url task/1
  def show
    puts "***** #{params}"
    @task = Task.find params[:id] # @task is available for the view
  end

  def index #calls index method, so we're defining it here
    @tasks = Task.all # Task is the class
  end

  def new
    @task = Task.new
  end

  def edit #enables 'edit' for tasks
     @task = Task.find params[:id]
  end

  def update # should enable 'edit' to be saved; in edit.html.erb
    @task = Task.find(params[:id])
      if @task.update(task_params)
        flash[:success] = "Task updated!"
        redirect_to @task
      else
        render 'edit'
      end
    end

  def create #this could also be 'def new'?
      # getting parameters the user is entering, this info gets
      # passed to the Task controller; takes attrbutes and makes new customer
      @task = Task.new(task_params) #using strong params in the 'create' action
      #@task.user = current_user
    if @task.save
      flash[:notice] = "Task created!"
      redirect_to @task #or root_path # the user 'create' action with a save and a redirect
    else
      render :new #if there's a problem creating the new customer
    end
  end

  private # no public access to parameters

  def task_params
    params.require(:task).permit(:project_id, :user_id, :task_name)
  end
end
