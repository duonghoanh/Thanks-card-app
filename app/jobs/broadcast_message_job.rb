class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room_channel", render_message["message"]
  end


  eceived: (data) ->
  # Called when there's incoming data on the websocket for this channel
  $('#messages').append data
speak: (message) ->
  @perform 'speak', message: message

  private
  def render_message(message)
    ApplicationController.renderer.render message
  end
end
