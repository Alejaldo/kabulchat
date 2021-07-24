jQuery(document).on 'turbolinks:load', ->
  App.status = App.cable.subscriptions.create "StatusChannel",
    connected: ->

    disconnected: ->

    received: (data) ->
      console.log('Received data: ' + JSON.stringify(data))

      user = data.user.nickname

      $('#onlinenow').empty()
      $('#onlinenow').append("<li>#{user}</li>")

