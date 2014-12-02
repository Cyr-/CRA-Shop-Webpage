class OrdersController < ApplicationController
  def order_now
    @categories = Category.all
    @product = Product.find(params[:id])
    @user = User.new
  end

  def complete
    @categories = Category.all
  end
end
