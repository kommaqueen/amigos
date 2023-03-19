class MessagesController < ApplicationController

  def create
    @chatroom = Friendship.find(params[:friendship_id])
    @message = Message.new(message_params)
    @message.friendship = @chatroom
    @message.user = current_user

    @message.save
    FriendshipChannel.broadcast_to(
      @chatroom,
      message: render_to_string(partial: "messages/message", locals: { message: @message }),
      sender_id: @message.user.id
      #render_to_string(partial: "messages/message", locals: { message: @message })
    )
    head :ok #dont send a view, dont make redirect.
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
