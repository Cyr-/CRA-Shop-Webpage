class OrdersController < ApplicationController
  def order
    @categories = Category.all
    @user = User.new
    @line_items = []
    @cart = session[:cart] ||= []
    @cart.each do |product_id|
      @line_items << Product.find_by(product_id)
      @sum += Product.find(id).sale_price.zero? ? Product.find(id).price : Product.find(id).sale_price
    end

    order = @user.orders.build

    order.amount = @sum
    order.tax = @sum *
    order.shipped = false
    order.paid = false
  end

  def order_complete
    @categories = Category.all
  end

  def add_to_cart
    (session[:cart] ||= []) << params[:id]
    redirect_to :back
  end

  def remove_from_cart
    (session[:cart] ||= []).delete_at(session[:cart].index(params[:id]) || session[:cart].length)

    if session[:cart].empty?
      session.delete(:cart)
      redirect_to :root
    else
      redirect_to :back
    end
  end

  def cart
    @categories = Category.all
  end
end
