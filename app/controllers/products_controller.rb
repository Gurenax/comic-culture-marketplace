class ProductsController < ApplicationController
  before_action :set_profile!
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    # redirect_to new_profile_path if user_signed_in? and current_user.profile.nil?
    @products = Product.all
    # Add to Cart buttons in product listing
    @shopping_cart = ShoppingCart.new
  end

  # GET /products/1
  # GET /products/1.json
  def show
    # Toggle product view if user has not already viewed the product
    @product.toggle_viewed_by(current_user)

    # Initialise a new shopping cart item
    @shopping_cart = ShoppingCart.new
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.seller = current_user
    
    respond_to do |format|
      if @product.save

        # Get photos directly from the params and save them to the database one by one
        if params[:product][:images]
          params[:product][:images].each { |image|
            Photo.create(product: @product, image: image)
          }
        end

        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)

        # Get photos directly from the params and save them to the database one by one
        if params[:product][:images]
          params[:product][:images].each { |image|
            Photo.create(product: @product, image: image)
          }
        end

        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:seller_id, :name, :price, :description, :condition, :status, :category, :manufacturer, :publisher, :publish_date, :author, :illustrator, :isbn_10, :isbn_13, :dimensions, :weight, :keywords, :postage)
    end

end
