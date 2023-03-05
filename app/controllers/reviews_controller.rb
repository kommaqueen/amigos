class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def create
    @place = Place.find(params[:place_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.place = @place
    @review.rating = avg_rating
    if @review.save
      redirect_to place_path(@place)
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

  def avg_rating
    all_ratings = [@review.cleanliness, @review.condition, @review.age_appropriate, @review.fun_factor]
    all_ratings.sum.to_f / all_ratings.length
  end

end
