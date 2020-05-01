class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :project_id
      t.string :user_id
      t.string :task_name

      t.timestamps
    end
  end
end
