App.status = App.cable.subscriptions.create "StatusChannel",
  connected: ->

  disconnected: ->

  received: (data) ->

