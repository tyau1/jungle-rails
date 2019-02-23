class ReviewsController < ApplicationController

  #get the product id , review comment and rating
  #1. Get the product by the find_by id command.
  #Product to create a new review by passing review comment and rating
  def create
    product = Product.find_by_id(params[:product_id])
    review = Review.new(
      product: product,
      user: current_user,
      description: review_params[:description],
      rating: review_params[:rating]
    )

    if review.save
      redirect_to product_path(id: params[:product_id])
    else
      puts review.errors.full_messages
      redirect_to '/login', notice: 'review has not been saved'
    end
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
