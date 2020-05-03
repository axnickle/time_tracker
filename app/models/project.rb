class Project < ApplicationRecord
  has_many :tasks
  belongs_to :customer #1 project has only 1 project
end
