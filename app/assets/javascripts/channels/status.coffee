jQuery(document).on 'turbolinks:load', ->
  App.status = App.cable.subscriptions.create "StatusChannel",
    connected: ->

    disconnected: ->

    received: (data) ->
      console.log('Received data: ' + JSON.stringify(data))

      user = data.user.nickname
      user_id = data.user.id
      tag_id = "user-#{user_id}"
  
      if data.user.online == false && $("##{tag_id}") != null
        $("##{tag_id}").remove()
      else if data.user.online == true 
        $('#onlinenow').append(data.html)
