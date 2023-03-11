class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :sandbox]

  def home
    @places = Place.all
    @latest = Place.order(created_at: :desc).limit(5)
  end

  def sandbox
  end

  def search
    if params[:query].present?
      @places = PgSearch.multisearch(params[:query]).where(searchable_type: "Place").map { |place| Place.find(place.searchable_id)}
      @events = PgSearch.multisearch(params[:query]).where(searchable_type: "Event").map { |event| Event.find(event.searchable_id)}
      @events.each do |event|
        @places << event.place
      end
    else
      @places = Place.all
      @events = Event.where(public: true)
    end
    @markers = @places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        info_window_html: render_to_string(partial: "pages/info_window", locals: { place: place }, formats: :html)
      }
    end
    respond_to do |format|
      format.html
      format.json
    end
  end
end
