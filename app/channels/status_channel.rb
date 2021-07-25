class StatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'StatusChannel'

    current_user.update(online: true)
    html = ApplicationController.render(partial: "users/user", locals: { user: current_user })
    ActionCable.server.broadcast "StatusChannel", { user: current_user, html: html }
  end

  def unsubscribed
    current_user.update(online: false)
    ActionCable.server.broadcast "StatusChannel", { user: current_user }
  end
end
