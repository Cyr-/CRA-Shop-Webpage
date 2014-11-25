class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.integer :province_id
      t.string :postal_code
      t.string :phone
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
