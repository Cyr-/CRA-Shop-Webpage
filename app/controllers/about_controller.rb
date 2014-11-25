class AboutController < ApplicationController
  def index
    @page = Page.where(title: 'About').take
    @categories = Category.all
  end
end
