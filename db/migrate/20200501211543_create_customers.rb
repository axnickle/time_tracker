class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t| #|t| points to the customers - the 'customer table' object
      #t.has_many :projects #"table".has_many
      t.string :company
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
