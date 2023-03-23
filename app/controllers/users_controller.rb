class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @friendship = Friendship.new
    # @friendships = Friendship.where(status: "pending").where(receiver: current_user).take
    # @friendships = current_user.friendships_as_receiver.where(status: "pending").or(current_user.friendships_as_asker.where(status: "pending")).take
    @chatroom = Friendship.where(status: "accepted").where(asker: @user).or(Friendship.where(status: "accepted").where(receiver: @user))
    @chatroom = @chatroom.where(status: "accepted").where(asker: current_user).or(@chatroom.where(status: "accepted").where(receiver: current_user)).take
    @pending = Friendship.where(status: "pending").where(asker: @user).or(Friendship.where(status: "pending").where(receiver: @user))
    @pending = @pending.where(status: "pending").where(asker: current_user).or(@pending.where(status: "pending").where(receiver: current_user)).take
    # @myacceptedinvites = myacceptedevents
    @mypublicevents = mypublicevents
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  # def myacceptedevents
  #   invites = Invite.where(status: "accepted").where(receiver: User.find(params[:id]))
  #   events = []
  #   invites.each do |invite|
  #     events << invite.event
  #   end
  #   events
  # end

  def user_params
    params.require(:user).permit(
      :bio
    )
  end

  def mypublicevents
    attendances = Attendance.where(user: User.find(params[:id]))
    events = []
    attendances.each do |attendance|
      events << attendance.event
    end
    events
  end
end
