class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @friendship = Friendship.new
    @friendships = Friendship.where(status: "pending").where(receiver: current_user, asker: @user).take
    @chatroom = Friendship.where(status: "accepted").where(asker: @user).or(Friendship.where(status: "accepted").where(receiver: @user))
    @chatroom = @chatroom.where(status: "accepted").where(asker: current_user).or(@chatroom.where(status: "accepted").where(receiver: current_user)).take
    @pending = Friendship.where(status: "pending").where(asker: @user).or(Friendship.where(status: "pending").where(receiver: @user))
    @pending = @pending.where(status: "pending").where(asker: current_user).or(@pending.where(status: "pending").where(receiver: current_user)).take
    @myacceptedinvites = myacceptedevents
  end

  private

  def myacceptedevents
    invites = Invite.where(status: "accepted").where(receiver: User.find(params[:id]))
    events = []
    invites.each do |invite|
      events << invite.event
    end
    events
  end

  # where asker: current_user
end
