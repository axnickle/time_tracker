class CreateTaskEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :task_entries do |t|
      t.integer :task_id
      t.integer :duration #not time spent
      t.string :note
      t.datetime :start_time

      t.timestamps
    end
  end
end
