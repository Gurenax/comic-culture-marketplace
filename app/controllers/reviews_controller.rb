class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_seller_profile, only: [:new, :create]
  # before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  # def index
  #   # @reviews = Review.all
  #   @reviews = Review.where(seller: @seller_profile)
  # end

  # GET /reviews/1
  # GET /reviews/1.json
  # def show
  # end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  # def edit
  # end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.buyer_id = current_user.id
    @review.seller_id = @seller_profile.id

    redirect_to review_success_path
  end

  # Show success message on completed review
  def success
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  # def update
  #   respond_to do |format|
  #     if @review.update(review_params)
  #       format.html { redirect_to profile_review_path(@review.seller, @review), notice: 'Review was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @review }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @review.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  # def destroy
  #   @review.destroy
  #   respond_to do |format|
  #     format.html { redirect_to profile_reviews_url, notice: 'Review was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:seller_id, :comment, :rating)
    end

    # Get seller profile
    def set_seller_profile
      @seller_profile = Profile.find(params[:profile_id])
    end
end
