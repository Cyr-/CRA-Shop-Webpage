class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.decimal :gst, precision: 4, scale: 3
      t.decimal :pst, precision: 4, scale: 3
      t.decimal :hst, precision: 4, scale: 3

      t.timestamps
    end
  end
end
