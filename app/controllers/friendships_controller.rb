class FriendshipsController < ApplicationController

  def index
    #@chatroom = Friendship.where(status: "accepted").where(asker: @user).or(Friendship.where(status: "accepted").where(receiver: @user))
    #@chatroom = @chatroom.where(status: "accepted").where(asker: current_user).or(@chatroom.where(status: "accepted").where(receiver: current_user)).take
    @chatrooms = Friendship.where(asker: current_user).or(Friendship.where(receiver: current_user))
  end

  def show
    @chatroom = Friendship.find(params[:id])
    @message = Message.new
  end

  def create
    @friendship = Friendship.new
    @user = User.find(params[:user_id])
    @friendship.asker = current_user
    @friendship.receiver = @user
    if @friendship.save
      redirect_to user_path(@friendship.receiver.id)
    else
      render "users/show", status: :unprocessable_entity
      flash[:alert] = "Something went wrong."
    end
  end

  def update

    @friendship = Friendship.find(params[:id])
    @friendship.update(friendship_params)

    redirect_to user_path(@friendship.asker.id)
  end

  private

  def friendship_params
    params.require(:friendship).permit(:status)
  end

end
