class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all
    @friendship = Friendship.new
  end

  def index
    @users = User.all
  end

end
