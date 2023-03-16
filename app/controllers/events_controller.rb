class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def show
    @attendees = Invite.where(event_id: @event).where(status: "accepted")
  end

  def new
    @place = Place.find(params[:place_id])
    @event = Event.new
  end

  def create
    @place = Place.find(params[:place_id])
    @event = Event.new(event_params)
    @event.place = @place
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render "events/new", status: :unprocessable_entity
      flash[:alert] = "Something went wrong."
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @place = @event.place
    @event.destroy
    redirect_to place_path(@place), status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :category,
      :start_time,
      :end_time,
      :public
    )
  end
end
