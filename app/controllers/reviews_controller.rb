class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def create
    @place = Place.find(params[:place_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.place = @place
    if @review.save
      redirect_to place_path
    else
      render "places/show", status: :unprocessable_entity
      flash[:alert] = "Something went wrong."
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    @place = Place.find(params[:place_id])
    redirect_to celebrity_path(@celebrity), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(
      :comment,
      :rating,
      :place_id,
      :user_id,
      :cleanliness,
      :condition,
      :age_appropriate,
      :fun_factor
    )
  end

end
