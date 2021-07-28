class PresenceChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'PresenceChannel'
    stream_for current_user
  end

  def unsubscribed
  end
end
