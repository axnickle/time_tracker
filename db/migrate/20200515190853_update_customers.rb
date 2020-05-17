class UpdateCustomers < ActiveRecord::Migration[6.0]
  change_table :customers do |t|
    t.remove :address
    t.string :address1
    t.string :address2
    t.string :address3
    t.string :phone1
    t.string :phone2
    t.string :fax1
    t.string :fax2
    t.string :email
    t.string :website
  end
end
