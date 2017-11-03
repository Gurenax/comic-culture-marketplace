class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile!
  before_action :set_shopping_cart, only: [:show, :destroy]
  protect_from_forgery

  # GET /shopping_carts
  # GET /shopping_carts.json
  def index
    # Shopping cart of the current user
    @shopping_cart = ShoppingCart.where(buyer: current_user)
    # Prepare the Order for Checkout
    @order = Order.new
  end

  # POST /shopping_carts
  # POST /shopping_carts.json
  def create
    @shopping_cart = ShoppingCart.new(shopping_cart_params)

    respond_to do |format|
      if @shopping_cart.save

        # Set product status to Checked Out
        @shopping_cart.change_product_status_to('Checked Out') if @shopping_cart.product.status == 'Available'

        format.html { redirect_to shopping_carts_url, notice: 'Shopping cart was successfully created.' }
        format.json { render :show, status: :created, location: @shopping_cart }
      else
        format.html { render :new }
        format.json { render json: @shopping_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_carts/1
  # DELETE /shopping_carts/1.json
  def destroy
    # Set product status to Available
    @shopping_cart.change_product_status_to('Available') if @shopping_cart.product.status == 'Checked Out'
    @shopping_cart.destroy

    respond_to do |format|
      format.html { redirect_to shopping_carts_url, notice: 'Shopping cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_cart
      @shopping_cart = ShoppingCart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_cart_params
      params.require(:shopping_cart).permit(:buyer_id, :product_id)
    end
end
