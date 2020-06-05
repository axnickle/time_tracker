class Project < ApplicationRecord
  has_many :tasks
  belongs_to :customer #1 project has only 1 customer

  def name_with_company #just for display- send data back to view for display
    "#{self.project_name} | #{self.customer.company}" # project name + customer
  end
end

#create duration methods to be able to add time entry; add time entries
