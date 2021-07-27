class StatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'StatusChannel'

    current_user.update(online: true)
    ActionCable.server.broadcast "StatusChannel", { user: current_user }
  end

  def unsubscribed
    current_user.update(online: false)
    ActionCable.server.broadcast "StatusChannel", { user: current_user }
  end
end
