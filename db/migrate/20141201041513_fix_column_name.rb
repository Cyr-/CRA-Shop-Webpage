class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :province_id, :region_id
  end
end
