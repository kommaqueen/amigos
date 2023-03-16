class FriendshipChannel < ApplicationCable::Channel
  def subscribed
    friendship = Friendship.find(params[:id])
    stream_for friendship
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
