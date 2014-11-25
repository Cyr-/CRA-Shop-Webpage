class ContactController < ApplicationController
  def index
    @page = Page.where(title: 'Contact').take
    @categories = Category.all
  end
end
