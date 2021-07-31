jQuery(document).on 'turbolinks:load', ->
  App.presence = App.cable.subscriptions.create "PresenceChannel",
    connected: ->

    disconnected: ->

    received: (data) ->
