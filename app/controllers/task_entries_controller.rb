class TaskEntriesController < ApplicationController
  def index
    @task_entries = TaskEntry.all  #pulling task_entries out of Task_Entry model; TaskEntry is the model naem
  end

  def create
    #task_entry = task_entry.new(start: current = date, whatever other params we need to tie
      # to the task. (task id?)
    end

  def update
    #task_entry = find task entry via id in params task_entry.update.attribute(stop! current_time)
    #find task entry via time entry_id in params
      #check if mannually updated (pass time in minutes OR manually stop time)
      #if stope time passed, update stop_time calculated. time spent based on stop itself
      #else if no time passed
        #calculate time spent based on current time
  end
  end
