class PresenceService
  def initialize(user)
    @user = user
  end

  def still_connected?
    still_there = PresenceChannel.broadcast_to(@user, action: 'presence-check')

    return true if still_there.to_i.positive?

    false
  end
end
