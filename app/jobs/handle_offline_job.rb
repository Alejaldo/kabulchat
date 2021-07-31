class HandleOfflineJob < ApplicationJob
  queue_as :critical

  def perform(user)
    return if PresenceService.new(user).still_connected?

    user.update(online: false)
    ActionCable.server.broadcast "StatusChannel", { user: user }
  end
end
