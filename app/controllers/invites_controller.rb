class InvitesController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @invite = Invite.new
    @friends = current_user.friends
  end

  def create
    @event = Event.find(params[:event_id])
    @invite = Invite.new
    @invite.asker = current_user
    @invite.event = @event
    @invite.receiver = User.find(params[:invite][:receiver_id])
    
    if @invite.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @invite = Invite.find(params[:id])
    @invite.update(invite_params)

    redirect_to dashboard_path
  end

  private

  def invite_params
    params.require(:invite).permit(:status)
  end

end
