class ProductsController < ApplicationController
  def index
    @products = Product.order("id").page(params[:page]).per(5)
  end
end
