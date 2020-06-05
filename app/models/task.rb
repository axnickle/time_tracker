class Task < ApplicationRecord
  belongs_to :user #taks belong_to (a) user- singular
  belongs_to :project #tasks belong_to (a) project
  has_many :task_entries

  def has_running_task_entries?
     task_entries.any? { |task_entry| task_entry.duration.nil? } #implies task
  end

  def total_duration #calucate duration
    task_entries.sum(&:duration)
  end

end
