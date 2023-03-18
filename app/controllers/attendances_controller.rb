class AttendancesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new
  end

  def create
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new
    @attendance.event = @event
    @attendance.user = current_user
    respond_to do |format|
      if @attendance.save
        @attendances = Attendance.all
        format.html { redirect_to event_path(@event) }
        format.json
      else
        format.html { render "events/show", status: :unprocessable_entity }
        format.json
      end
    end
  end
end
