jQuery(document).on 'turbolinks:load', ->
  App.status = App.cable.subscriptions.create "StatusChannel",
    connected: ->

    disconnected: ->

    received: (data) ->
      $('#onlinenow').append data['users']
