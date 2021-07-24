class StatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'StatusChannel'

    if current_user
      current_user.update(online: true)
      ActionCable.server.broadcast "appearance_channel", { user: current_user, online: :on }
    end
  end

  def unsubscribed
    stream_from 'StatusChannel'
    
    if current_user
      current_user.update(online: false)
      ActionCable.server.broadcast "appearance_channel", { user: current_user, online: :off }
    end
  end
end
