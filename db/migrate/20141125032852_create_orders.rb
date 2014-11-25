class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :amount, precision: 10, scale: 2
      t.decimal :tax, precision: 10, scale: 2
      t.boolean :shipped

      t.timestamps
    end
  end
end
