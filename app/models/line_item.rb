class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :order_id, :product_id, :price,
            :quantity, presence: true
end
