class ProductsController < ApplicationController
  before_action :set_profile!
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    # @products = Product.all

    # Latest additions
    @latest_products = Product.where(status: 'Available').order(created_at: :desc)

    # Recently sold
    @sold_products = Product.where(status: 'Sold').order(updated_at: :desc)

    # Add to Cart buttons in product listing
    @shopping_cart = ShoppingCart.new

    # Add to Watchlist buttons
    @watchlist = Watchlist.new

    # Top viewed products
    @top_products = Product.where(status: 'Available').sort_by(&:view_count).reverse

    # Carousel Images
    # @carousel = Photo.limit(5).order("RANDOM()")
  end

  # Product category - Comic Books & Graphic Novels
  def books
    @products = Product.category('Comic Books & Graphic Novels')
  end

  # Product category - Toys & Collectibles
  def toys
    @products = Product.category('Toys & Collectibles')
  end

  # Product category - Costumes
  def costumes
    @products = Product.category('Costumes')
  end

  # Product category - Clothing & Apparel
  def apparel
    @products = Product.category('Clothing & Apparel')
  end

  # Top viewed producta
  def top_products
    @products = Product.all.sort_by(&:view_count).reverse
  end
  
  # GET /products/1
  # GET /products/1.json
  def show
    # Toggle product view if user has not already viewed the product
    @product.toggle_viewed_by(current_user)

    # Top Customer Review
    @top_customer_reviews = @product.seller.top_customer_reviews

    # Initialise a new shopping cart item
    @shopping_cart = ShoppingCart.new
    # Initialise a new watchlist item
    @watchlist = Watchlist.new
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
