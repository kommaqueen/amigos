class MessagesController < ApplicationController

  def create
    @chatroom = Friendship.find(params[:friendship_id])
    @message = Message.new(message_params)
    @message.friendship = @chatroom
    @message.user = current_user
    if @message.save
      redirect_to friendship_path(@chatroom)
    else
      render "friendships/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
