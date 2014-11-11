class Product < ActiveRecord::Base
  validates :name, :price, :stock_quantity, :description, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :stock_quantity, numericality: { only_integer: true }
end
