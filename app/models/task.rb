class Task < ApplicationRecord
  belongs_to :user #taks belong_to (a) user- singular
  belongs_to :project #tasks belong_to (a) project
  has_many :task_entry
end
