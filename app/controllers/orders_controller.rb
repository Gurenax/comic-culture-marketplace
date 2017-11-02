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
    @shopping_carts = ShoppingCart.where(buyer: current_user)
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    
    @shopping_cart = ShoppingCart.where(buyer: current_user)

    # Amount in cents
    @amount = (@shopping_cart.sum(&:product_price) * 100).to_i

    # New Rental to save to database
    # @rental = Rental.new
    # The video_id comes from the form (hidden_tag :video_id)
    # @rental.video = Video.find(rental_params[:video_id])
    # @rental.user = current_user

    # Amount in cents
    # @amount = 500
    
      customer = Stripe::Customer.create(
        :email => @order.buyer.email, #current_user.email, #params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Test Description', #@rental.video.name,
        :currency    => 'aud'
      )
    
      @order.charge_identifier = charge.id
      @order.save

      @shopping_cart.each do |cart|
        product_id = cart.product.id
        product = Product.find(product_id)
        product.status = 'Sold'
        product.save!
        OrderItem.create!(order: @order, product_id: product_id)
      end
      @shopping_cart.destroy_all

      redirect_to root_path #shopping_carts_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to shopping_carts_url
      #redirect_to new_rental_path(video_id: @rental.video.id)



    # respond_to do |format|
    #   if @order.save
        
    #     format.html { redirect_to @order, notice: 'Order was successfully created.' }
    #     format.json { render :show, status: :created, location: @order }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @order.errors, status: :unprocessable_entity }
    #   end
    # end
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
