class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile!
  # before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_user.orders
  end

  # GET /orders/new
  def new
    @order = Order.new

    # Get user's shopping cart
    @shopping_cart = current_user.shopping_cart

    # Total price of products in cents
    @amount = @shopping_cart.products_total_price + @shopping_cart.postage_total_price
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    
    # Get user's shopping cart
    @shopping_cart = current_user.shopping_cart

    # Total price of products in cents
    @amount = @shopping_cart.products_total_price + @shopping_cart.postage_total_price
    
    # Begin stripe transaction
    customer = Stripe::Customer.create( email: @order.buyer.email, source: params[:stripeToken] )
    charge = Stripe::Charge.create( customer: customer.id, amount: @amount, description: 'Comic Culture Marketplace', currency: 'aud' )
    @order.charge_identifier = charge.id
    @order.save
    # End of stripe transaction

    # For every product in shopping cart
    @shopping_cart.products.each do |product|
      # Change the product status to Sold
      product.change_status_to('Sold')
      # Create an Order Item for each product
      @order.add_product(product)
    end

    # Remove all products from shopping cart
    @shopping_cart.products.destroy_all

    render :success

  rescue Stripe::InvalidRequestError => e
    flash[:error] = e.message
    redirect_to new_order_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:buyer_id, :charge_identifier)
    end
end
