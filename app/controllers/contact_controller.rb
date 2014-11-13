class ContactController < ApplicationController
  def index
    @page = Page.where(title: 'Contact').take
  end
end
