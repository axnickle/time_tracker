class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :Company
      t.string :Address
      t.string :City
      t.string :State
      t.string :Zip

      t.timestamps
    end
  end
end
