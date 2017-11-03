class WatchlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile!
  before_action :set_watchlist, only: [:show, :destroy]
  protect_from_forgery

  # GET /watchlists
  # GET /watchlists.json
  def index
    @watchlists = Watchlist.all
    # Add to Cart buttons in watchlist
    @shopping_cart = ShoppingCart.new
  end

  # POST /watchlists
  # POST /watchlists.json
  def create
    @watchlist = Watchlist.new(watchlist_params)

    respond_to do |format|
      if @watchlist.save
        format.html { redirect_to watchlists_url, notice: 'Watchlist was successfully created.' }
        format.json { render :show, status: :created, location: @watchlist }
      else
        format.html { render :new }
        format.json { render json: @watchlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /watchlists/1
  # DELETE /watchlists/1.json
  def destroy
    @watchlist.destroy
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
    def watchlist_params
      params.require(:watchlist).permit(:buyer_id, :product_id)
    end
end
