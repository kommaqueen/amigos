class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :sandbox]

  def home
    @places = Place.all
    @latest = Place.order(created_at: :desc).limit(5)
  end

  def sandbox
  end

  def search
    @places = Place.all
    @markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { place: place })
      }
    end
  end
end
