class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.decimal :gst
      t.decimal :pst
      t.decimal :hst

      t.timestamps
    end
  end
end
