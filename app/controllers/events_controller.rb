class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @event = Event.new
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
