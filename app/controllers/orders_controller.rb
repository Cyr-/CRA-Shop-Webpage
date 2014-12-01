class OrdersController < ApplicationController
  def order_now
    @categories = Category.all
    @user = User.new
  end
end
