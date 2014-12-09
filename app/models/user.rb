class User < ActiveRecord::Base
  has_many :orders
  belongs_to :region
end
