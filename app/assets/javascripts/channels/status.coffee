jQuery(document).on 'turbolinks:load', ->
  App.status = App.cable.subscriptions.create "StatusChannel",
    connected: ->

    disconnected: ->

    received: (data) ->
      { id, online, nickname } = data.user
      tag_id = "user-#{id}"
      html = "<li id='user-#{id}'>#{nickname}</li>"
  
      if !online && $("##{tag_id}") != null
        $("##{tag_id}").remove()
      else if online && $("##{tag_id}").length == 0
        $('#onlinenow').append(html)
