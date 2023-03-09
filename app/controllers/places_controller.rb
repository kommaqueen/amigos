class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.all
    case params[:category].downcase
    when "newest"
      @places = Place.order(created_at: :desc).limit(5)
    when "popular"
      @places = Place.all.sample(3)
    when "all ages"
      @places = Place.all.sample(5)
    when "kindercafe"
      @places = Place.where(category: "kindercafe").limit(5)
    end

    respond_to do |format|
      format.html
      format.json do
        render json: { content: render_to_string(partial: "pages/category_cards", formats: [ :html ], locals: { places: @places }) }
      end
    end
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
  end

  private

  def latest_places
  end

  def place_params
    params.require(:place).permit(:name, :category, :address, :description, :age_range, :photo)
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
