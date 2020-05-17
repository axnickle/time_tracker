class AddStopTimeToTaskEntries < ActiveRecord::Migration[6.0]
  change_table :task_entries do |t|
    t.datetime :stop_time
  end

end
