class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.order(id: :desc).limit(6)
    @categories = Category.all
  end

  def products
    @products = Product.order('id')
                .page(params[:page]).per(6)
    @categories = Category.all
  end

  def show
  end

  def new
    @products = Product.where('created_at > ?', 7.days.ago)
                .page(params[:page]).per(6)
    @categories = Category.all
  end

  def updated
    @products = Product.where('updated_at > ?', 7.days.ago)
                .page(params[:page]).per(6)
    @categories = Category.all
  end

  def sale
    @products = Product.where('sale_price != ?', '0')
                .page(params[:page]).per(6)
    @categories = Category.all
  end

  def search_results
    wildcard_keywords = "%#{params[:keyword_search]}%"
    @products = Product.where('name LIKE ?',  wildcard_keywords)
                .page(params[:page]).per(6)
    @categories = Category.all
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
