class HandleOfflineJob < ApplicationJob
  queue_as :critical

  def perform(user)

    return if user.still_connected?

    user.update(online: false)

  end
end
