class FriendshipsController < ApplicationController

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
      redirect_to dashboard_path
    else
      render "users/show", status: :unprocessable_entity
      flash[:alert] = "Something went wrong."
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.update(friendship_params)

    redirect_to dashboard_path
  end

  private

  def friendship_params
    params.require(:friendship).permit(:status)
  end

end
