class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all
    @friendship = Friendship.new
    @chatroom = Friendship.where(status: "accepted").where(asker: @user).or(Friendship.where(status: "accepted").where(receiver: @user))
    @chatroom = @chatroom.where(status: "accepted").where(asker: current_user).or(@chatroom.where(status: "accepted").where(receiver: current_user)).take
    
  end

  def index
    @users = User.all
  end

end
