class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile!
  # before_action :set_shopping_cart, only: [:show, :destroy]
  # protect_from_forgery

  # GET /shopping_carts
  # GET /shopping_carts.json
  def index
    # Get shopping cart items
    @shopping_cart = current_user.shopping_cart if !current_user.shopping_cart.blank?

    if @shopping_cart.blank?
      # Set prices to 0
      @postage_total_price = 0.0
      @postage_total_price = 0.0
    else
      # Get products total price
      @postage_total_price = @shopping_cart.products_total_price

      # Get total postage price
      @postage_total_price = @shopping_cart.postage_total_price
    end

    # Prepare the Order for Checkout
    @order = Order.new
  end

  # POST /shopping_carts
  # POST /shopping_carts.json
  def create
    # Get the product id
    shopping_cart_item = params.require(:shopping_cart)[:product_id]
    # Find the product id
    product = Product.find(shopping_cart_item)
    # Find the shopping cart
    @shopping_cart = current_user.shopping_cart unless current_user.shopping_cart.blank?
    if current_user.shopping_cart.blank?
      @shopping_cart = ShoppingCart.new(buyer: current_user)
    end
    # Add product to shopping cart
    @shopping_cart.add_product(product)
    # Change product status to Reserved
    product.change_status_to('Reserved')

    redirect_to shopping_carts_url
  end

  # DELETE /shopping_carts/1
  # DELETE /shopping_carts/1.json
  def destroy
    # Get the product id
    shopping_cart_item = params.permit(:id)[:id]
    # Find the product id
    product = Product.find(shopping_cart_item)
    # Delete product id from shopping_cart
    current_user.shopping_cart.remove_product(product)
    # Set product status to Available
    product.change_status_to('Available')

    redirect_to shopping_carts_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_cart
      @shopping_cart = ShoppingCart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def shopping_cart_params
    #   params.require(:shopping_cart).permit(:buyer_id)
    # end
end
