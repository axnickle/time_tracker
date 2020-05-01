class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, force: :cascade do |t|
      t.string :name
      t.string :email
      t.string :password_digest #has_secure_password

      t.timestamps
    end
  end
end
