class OrdersController < ApplicationController
  def order
    @categories = Category.all
    @user = User.new
  end

  def order_submit
    @user = User.new(user_params)
    @line_items = []
    @sum = 0
    @cart = session[:cart] ||= []
    @cart.each do |product_id|
      @line_items << Product.find_by(product_id)
      @sum += Product.find(product_id).sale_price.zero? ? Product.find(product_id).price : Product.find(product_id).sale_price
    end

    order = @user.orders.build

    order.user_id = @user.id
    order.amount = @sum
    order.tax = @sum * (@user.region.gst + @user.region.pst + @user.region.hst)
    order.shipped = false
    order.paid = false

    order.save

    @line_items.each do |item|
      line_item = order.line_items.build

      line_item.product_id = item.id
      line_item.price = item.sale_price.zero? ? item.price : item.sale_price
      line_item.quantity = 1

      line_item.save
    end

    session.delete(:cart)
    
    redirect_to :order_complete
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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :city, :region_id, :postal_code, :address, :phone, :email)
  end
end
