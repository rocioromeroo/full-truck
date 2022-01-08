class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @freight = Freight.find(params[:freight_id])
    @review = Review.new(review_params)
    @review.freight = @freight
    if @review.save
      redirect_to freight_path(@freight)
    else
      redirect_to 'users/sign_in'
      # render 'freight/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:stars, :comment)
  end
end
