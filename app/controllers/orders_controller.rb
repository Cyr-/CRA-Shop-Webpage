class OrdersController < ApplicationController
  def order
    @categories = Category.all
    @user = User.new
  end

  def order_submit
    @user = create_user
    @line_items = []
    @cart = session[:cart] ||= []
    @line_items = get_line_items(@cart)
    @sum = get_cart_sum(@line_items)

    create_order(@user, @line_items, @sum)
    end_order
  end

  def order_complete
    @categories = Category.all
  end

  def add_to_cart
    (session[:cart] ||= []) << params[:id]
    redirect_to :back
  end

  def remove_from_cart
    (session[:cart] ||= []).delete_at(session[:cart].index(params[:id]) ||
    session[:cart].length)

    cart_empty?
  end

  def cart
    @categories = Category.all
  end

  private

  def user_params
    params.require(:user)
      .permit(:first_name, :last_name, :city,
              :region_id, :postal_code, :address, :phone, :email)
  end

  def create_order(user, line_items, sum)
    order = user.orders.build

    order.user_id = user.id
    order.amount = sum
    order.tax = sum * user_tax(user)
    order.shipped = false
    order.paid = false

    order.save
    create_line_items(line_items, order)
  end

  def create_line_items(line_items, order)
    line_items.each do |item|
      line_item = order.line_items.build

      line_item.product_id = item.id
      line_item.price = item.sale_price.zero? ? item.price : item.sale_price
      line_item.quantity = 1

      line_item.save
    end
  end

  def end_order
    session.delete(:cart)
    redirect_to :order_complete
  end

  def create_user
    User.new(user_params)
  end

  def get_line_items(cart)
    line_items = []
    cart.each do |product_id|
      line_items << Product.find_by(product_id)
    end
    line_items
  end

  def get_cart_sum(line_items)
    sum = 0
    line_items.each do |product|
      if product.sale_price.zero?
        sum += product.price
      else
        sum += product.sale_price
      end
    end
    sum
  end

  def cart_empty?
    if session[:cart].empty?
      session.delete(:cart)
      redirect_to :root
    else
      redirect_to :back
    end
  end

  def user_tax(user)
    user.region.gst + user.region.pst + user.region.hst
  end
end
