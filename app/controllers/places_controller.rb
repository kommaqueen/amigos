class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.all
  end

  def show
    @review = Review.new
    @reviews = Review.all
    @place_avg_rating = place_avg_rating
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
  end

  private

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
    avg / @place.reviews.length
  end
end
