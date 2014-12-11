class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items

  validates :user_id, :amount, :tax,
            :shipped, :paid, presence: true
end
