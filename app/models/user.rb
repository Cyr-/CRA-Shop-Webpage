class User < ActiveRecord::Base
  has_many :orders
  belongs_to :region

  validates :first_name, :last_name, :city, :email, :region_id,
            :postal_code, :phone, :address, :postal_code, presence: true
end
