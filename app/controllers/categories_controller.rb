class CategoriesController < ApplicationController
  def index
    @products = Category.find_by_id(params[:id]).products.page(params[:page]).per(6)
    @categories = Category.all
  end
end
