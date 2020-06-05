class TaskEntry < ApplicationRecord
  belongs_to :task

  def task_id_with_project_id #just for display- send data back to view for display
    "#{self.task_id} | #{self.task.project_id}" # project name + customer
  end

  def calculate_duration(start, stop) #if we don't have a stop time, it uses Time.now
    (start || start_time) - (stop || stop_time)).to_i / 60
  end
end

# look for start time; start = nil;
# calling start time from task_entry
