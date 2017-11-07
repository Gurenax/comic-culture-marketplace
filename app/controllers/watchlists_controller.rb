class WatchlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile!
  # before_action :set_watchlist, only: [:show, :destroy]
  # protect_from_forgery

  # GET /watchlists
  # GET /watchlists.json
  def index
    # Get watchlist items
    @watchlist_items = current_user.watchlist.products unless current_user.watchlist.blank?
    @watchlist = Watchlist.new
    
    # Add to Cart buttons in watchlist
    @shopping_cart = ShoppingCart.new
  end

  # POST /watchlists
  # POST /watchlists.json
  def create
    # Get the product id
    watchlist_item = params.require(:watchlist)[:product_id]
    # Find the product id
    product = Product.find(watchlist_item)
    # Find the watchlist
    @watchlist = current_user.watchlist unless current_user.watchlist.blank?
    if current_user.watchlist.blank?
      @watchlist = Watchlist.new(buyer: current_user)
    end
    # Add product to watchlist
    @watchlist.add_product(product)

    redirect_to watchlists_url
  end

  # DELETE /watchlists/1
  # DELETE /watchlists/1.json
  def destroy
    # Get the product id
    watchlist_item = params[:watchlist][:product_id]
    # Find the product id
    product = Product.find(watchlist_item)
    # Delete product id from watchlist
    current_user.watchlist.remove_product(product)

    respond_to do |format|
      format.html { redirect_to watchlists_url, notice: 'Watchlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watchlist
      @watchlist = Watchlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def watchlist_params
    #   params.require(:watchlist).permit(:buyer_id, :product_id)
    # end
end
