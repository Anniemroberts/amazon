class ReviewsController < ApplicationController

  def create
    review_params = params.require(:review).permit(:body, :rating)
    @review = Review.new review_params
    @product = Product.find params[:product_id]
    @review.user = current_user
    @review.product = @product
    if @review.save
      redirect_to product_path(params[:product_id]), notice: 'Review created!'
    else
      flash.now[:alert] = 'please fix errors'
      render 'products/show' #'render :show' will render answers/show
    end
  end

  def destroy
    review = Review.find params[:id]
    review.destroy
    redirect_to product_path(review.product_id), notice: 'Answer deleted!'
  end
end
