class StatusChannel < ApplicationCable::Channel
  after_unsubscribe :handle_offline

  def subscribed
    stream_from 'StatusChannel'

    current_user.update(online: true)
    ActionCable.server.broadcast "StatusChannel", { user: current_user }
  end

  def unsubscribed
  end

  private

  def handle_offline
    HandleOfflineJob.set(wait_until: Time.zone.now + 5).perform_later(current_user)
  end
end
