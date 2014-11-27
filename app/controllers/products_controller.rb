class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.limit(6)
    @categories = Category.all
  end

  def products
    @products = Product.order(:id)
                .page(params[:page]).per(6)
    @categories = Category.all

    were_any_products_returned?(@products)
  end

  def show
    @categories = Category.all
  end

  def new
    @products = Product.where('created_at > ?', 7.days.ago)
                .page(params[:page]).per(6)
    @categories = Category.all

    were_any_products_returned?(@products)
  end

  def updated
    @products = Product.where('updated_at > ?', 7.days.ago)
                .page(params[:page]).per(6)
    @categories = Category.all

    were_any_products_returned?(@products)
  end

  def sale
    @products = Product.where('sale_price != ?', '0')
                .page(params[:page]).per(6)
    @categories = Category.all

    were_any_products_returned?(@products)
  end

  def search_results
    wildcard_keywords = "%#{params[:keyword_search]}%"
    @categories = Category.all

    check_user_search_values(wildcard_keywords)

    were_any_products_returned?(@products)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def user_entered_keyword_search
    params[:keyword_search].present?
  end

  def user_limited_search_by_category
    params[:category].present?
  end

  def find_products_limited_by_category(wildcard_keywords)
    @products = Category.find_by_id(params[:category])
                .products.where('name LIKE ? or description LIKE ?',
                                wildcard_keywords, wildcard_keywords)
                .page(params[:page]).per(6)
  end

  def find_products_from_all_categories(wildcard_keywords)
    @products = Product.where('name LIKE ? or description LIKE ?',
                              wildcard_keywords, wildcard_keywords)
                .page(params[:page]).per(6)
  end

  def were_any_products_returned?(products)
    return @products = Product.order(:id)
                       .page(params[:page]).per(6) if products.blank?

    flash.now[:notice] = 'No products were found.'
  end

  def check_user_search_values(wildcard_keywords)
    if user_limited_search_by_category
      find_products_limited_by_category(wildcard_keywords)
    else
      find_products_from_all_categories(wildcard_keywords)
    end
  end
end
