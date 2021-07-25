jQuery(document).on 'turbolinks:load', ->
  App.status = App.cable.subscriptions.create "StatusChannel",
    connected: ->

    disconnected: ->

    received: (data) ->
      console.log('Received data: ' + JSON.stringify(data))

      user = data.user.nickname
      tag_id = "user-#{data.user.id}"
  
      if data.user.online == false && $("##{tag_id}") != null
        $("##{tag_id}").remove()
      else if data.user.online == true && $("##{tag_id}").length == 0
        $('#onlinenow').append(data.html)
