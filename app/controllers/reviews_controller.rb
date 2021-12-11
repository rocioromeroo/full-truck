class ReviewsController < ApplicationController
  def create
    @freight = Freight.find(params[:freight_id])
    @review = Review.new(review_params)
    @review.freight = @freight
    if @review.save
      redirect_to freight_path(@freight)
    else
      render 'freight/show'
    end
  end

  private

  def review_params
    params.require(:stars, :comment).permit(:stars, :comment)
  end
end
