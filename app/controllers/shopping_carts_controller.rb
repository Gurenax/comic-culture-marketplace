class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile!
  # before_action :set_shopping_cart, only: [:show, :destroy]
  # protect_from_forgery

  # GET /shopping_carts
  # GET /shopping_carts.json
  def index
    # Get shopping cart items
    @shopping_cart = current_user.shopping_cart.products if !current_user.shopping_cart.blank?
    # Prepare the Order for Checkout
    @order = Order.new
  end

  # POST /shopping_carts
  # POST /shopping_carts.json
  def create
    shopping_cart_item = params.require(:shopping_cart)[:product_id]
    
    product = Product.find(shopping_cart_item)
    @shopping_cart = ShoppingCart.find_by(buyer: current_user)
    
    if !@shopping_cart
      @shopping_cart = ShoppingCart.new(buyer: current_user)
      product.status = 'Reserved' if product.status == 'Available'
      product.save
      @shopping_cart.products << product
      @shopping_cart.save
    else
      product.status = 'Reserved' if product.status == 'Available'
      product.save
      @shopping_cart.products << product
      @shopping_cart.save
    end

    redirect_to shopping_carts_url
  end

  # DELETE /shopping_carts/1
  # DELETE /shopping_carts/1.json
  def destroy
    # Set product status to Available
    shopping_cart_item = params.permit(:id)[:id]
    current_user.shopping_cart.products.delete(shopping_cart_item)
    product = Product.find(shopping_cart_item)
    product.status = 'Available' if product.status == 'Reserved'
    product.save

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
    # def shopping_cart_params
    #   params.require(:shopping_cart).permit(:buyer_id)
    # end
end
