class TaskEntriesController < ApplicationController

  def show
    puts "***** #{params}"
    @task_entry = Task_entry.find params[:id] # @Task_entry is available for the view
  end

  def index
    @task_entries = TaskEntry.all  # pulling task_entries out of Task_Entry model; TaskEntry is the model name
  end

  def new # task_entry is what's in the data model; should render in /task_entries/new
    @task_entry = TaskEntry.new(start_time: Time.now)
  end

  def create # ? allows for user to enter time; defined task_entry_params below
      @task_entry = TaskEntry.new(task_id: params[:task_id], start_time: Time.now) # ?submit create
    if @task_entry.save
      flash[:notice] = "Time entry saved!"
      redirect_back(fallback_location: root_path) #back tasks_index, else root route
    else
      render :new
    end
  end

  def show
    @task_entry = TaskEntry.find(params[:id]) #entry id
  end

  def edit
    @task_entry = TaskEntry.find(params[:id])
  end

  def update  # directed to the 'stop' button - need to add
    @task_entry = TaskEntry.find(params[:id])
    @task_entry.stop_time = Time.now #? not rendering
    @task_entry.duration = @task_entry.calculate_duration(nil, @task_entry.stop_time)
    if @task_entry.save
      flash[:notice] = "Time entry was updated"
      redirect_back(fallback_location: task_task_entry_path(@task_entry.task, @task_entry))
     else
      flash[:notice] = "Time entry was not updated"
      render 'edit'
    end
   end

end


# when  I click on 'start' we need the "create" method
# when I clcik on 'stop' we need the "update method"
# need a 'note' file - "create" method
