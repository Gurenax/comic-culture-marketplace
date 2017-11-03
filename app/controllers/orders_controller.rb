class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile!
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  protect_from_forgery

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @shopping_cart = ShoppingCart.where(buyer: current_user)
    @amount = (@shopping_cart.map(&:product).map(&:price).sum * 100).to_i
    # @shopping_cart_hash = @shopping_carts.as_json.hash
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @shopping_cart = ShoppingCart.where(buyer: @order.buyer)
    # before_checkout_hash = params.permit(:shopping_cart_hash)[:shopping_cart_hash].to_i
    # during_checkout_hash = @shopping_cart.as_json.hash

    # Amount in cents
    @amount = (@shopping_cart.map(&:product).map(&:price).sum * 100).to_i
    customer = Stripe::Customer.create( email: @order.buyer.email, source: params[:stripeToken] )
    charge = Stripe::Charge.create( customer: customer.id, amount: @amount, description: 'Comic Culture Marketplace', currency: 'aud' )
    @order.charge_identifier = charge.id
    @order.save

    # @shopping_cart.map(&:checkout_products(@order))

    @shopping_cart.each do |cart_item|
      cart_item.change_product_status_to('Sold')
      OrderItem.create!(order: @order, product_id: cart_item.product_id)
    end
    @shopping_cart.destroy_all

    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_path
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:buyer_id, :charge_identifier)
    end
end
