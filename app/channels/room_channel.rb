class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
#app/channels/room_channel.rb
def speak(data)
  # ActionCable.server.broadcast "room_channel", data["message"]
  Message.create content: data["message"], user: current_user
end

  def speak
  end
end
