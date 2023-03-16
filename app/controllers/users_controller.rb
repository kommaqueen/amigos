class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all
    @friendship = Friendship.new
    @chatroom = Friendship.where(status: "accepted").where(asker: @user).or(Friendship.where(status: "accepted").where(receiver: @user))
  end

  def index
    @users = User.all
  end

end
