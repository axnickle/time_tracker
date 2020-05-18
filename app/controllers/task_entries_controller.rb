class TaskEntriesController < ApplicationController
  def index
    @task_entries = Task_entry.all  #pulling task_entries out of Task_Entry model
  end
end
