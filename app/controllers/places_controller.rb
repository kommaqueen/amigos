class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.all
    if params[:category].present?
      case params[:category].downcase
      when "newest"
        @places = Place.order(created_at: :desc).limit(5)
      when "popular"
        @places = popular
      when "all ages"
        @places = Place.where(age_range: "all").limit(5)
      when "kindercafe"
        @places = Place.where(category: "kindercafe").limit(5)
      end
    end

    respond_to do |format|
      format.html
      format.json do
        render json: { content: render_to_string(partial: "pages/category_cards", formats: [ :html ], locals: { places: @places, title: params[:category] }) }
      end
    end
  end

  def show
    @review = Review.new
    @reviews = Review.all
    @comment = Comment.new
    @place_avg_rating = @place.place_avg_rating
    @check_in = CheckIn.new
    check_ins_today
    check_ins_all
    @check_in_current_user = CheckIn.where(place: @place, user: current_user)
    @cleanliness = @place.cleanliness
    @condition = @place.condition
    @fun_factor = @place.fun_factor
    @myacceptedevents = myacceptedevents
    @myhostedevents = myhostedevents
    @my_hosted_and_accepted_events = @myacceptedevents + @myhostedevents
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

  # def favorite
  #   @place = Place.find(params[:id])
  #   current_user.favorite(@place)
  #   redirect_to place_path(@place)
  # end

  def favoriter
    @place = Place.find(params[:id])
    if current_user.favorited?(@place)
      current_user.unfavorite(@place)
    else
      current_user.favorite(@place)
    end

  end

  # def unfavorite
  #   @place = Place.find(params[:id])
  #   current_user.unfavorite(@place)
  #   redirect_to place_path(@place)
  # end

  private

  def latest_places
  end

  def place_params
    params.require(:place).permit(:name, :category, :address, :description, :age_range, photos: [])
  end

  def set_place
    @place = Place.find(params[:id])
  end

  def check_ins_today
    @check_ins = CheckIn.where(place: @place).where("created_at > ?", 1.day.ago)
  end

  def check_ins_all
    @check_ins_all = CheckIn.where(place: @place)
  end

  def popular
    popular_places = []
    places = Place.joins(:check_ins).group(:id).order('count(check_ins.id) desc').limit(5)
    places.each do |place|
      popular_places << place
    end
    if popular_places.count < 2
      popular_places << Place.all.sample(5)
    end
    popular_places
  end

  def myacceptedevents
    invites = Invite.where(status: "accepted").where(receiver: current_user)
    events = []
    invites.each do |invite|
      events << invite.event
    end
    events
  end

  def myhostedevents
    hosted_events = Invite.where(asker: current_user)
    events = []
    hosted_events.each do |hosted_event|
      events << hosted_event.event
    end
    events
  end
end
