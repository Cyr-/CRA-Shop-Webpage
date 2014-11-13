class AboutController < ApplicationController
  def index
    @page = Page.where(title: 'About').take
  end
end
