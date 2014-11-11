class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.order('id').limit(6)
  end

  def products
    @products = Product.order('id').page(params[:page]).per(5)
  end

  def show
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
