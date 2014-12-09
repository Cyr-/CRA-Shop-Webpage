class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :category
  has_many :orders, :through => :line_items
  
  validates :name, :price, :stock_quantity,
            :description, :sale_price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :sale_price, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_quantity, numericality: { only_integer: true }
end
