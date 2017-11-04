class SearchController < ApplicationController
  def index
    keywords = params.permit(:keywords)[:keywords]
    @products = Product.search(keywords)
  end

  def new
  end

end
