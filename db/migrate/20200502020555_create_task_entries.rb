class CreateTaskEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :task_entries do |t|
      t.string :task_id
      t.integer :duration
      t.string :note
      t.integer :start_time

      t.timestamps
    end
  end
end
