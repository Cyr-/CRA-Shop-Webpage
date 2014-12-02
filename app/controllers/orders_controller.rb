class OrdersController < ApplicationController
  def order_now
    @categories = Category.all
    @product = Product.find(params[:id])
    @user = User.new
  end

  def complete
    @categories = Category.all
  end

  def add_to_cart
    (session[:cart] ||= []) << params[:id]
    redirect_to :back
  end

  def remove_from_cart
    (session[:cart] ||= []).delete_at(session[:cart].index(params[:id]) || session[:cart].length)
    redirect_to :back
  end

  def cart
    @categories = Category.all
  end
end
