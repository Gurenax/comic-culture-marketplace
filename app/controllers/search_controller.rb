class SearchController < ApplicationController
  def index
    keywords = params.permit(:keywords)[:keywords]
    @products = Product.search(keywords, aroundRadius: 50000)
  end

  def new
  end

end
