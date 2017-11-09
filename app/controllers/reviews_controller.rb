class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_seller_profile, only: [:new, :create]

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.buyer_id = current_user.id
    @review.seller_id = @seller_profile.id
    @review.save

    render :success
  end

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
