class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.all
    # @latest = Place.order(created_at: :desc).limit(5)
  end

  def show
    @review = Review.new
    @reviews = Review.all
    @place_avg_rating = place_avg_rating
    @check_in = CheckIn.new
    check_ins_today
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to place_path(@place)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def latest_places
  end

  def place_params
    params.require(:place).permit(:name, :category, :address, :description, :age_range, photos: [])
  end

  def set_place
    @place = Place.find(params[:id])
  end

  def place_avg_rating
    avg = 0.00
    @place.reviews.each do |r|
      avg += r.rating
    end
    @place.reviews.empty? ? 0 : avg / @place.reviews.length
  end

  def check_ins_today
    @check_ins = CheckIn.where(place: @place).where("created_at > ?", 1.day.ago)
  end
end
