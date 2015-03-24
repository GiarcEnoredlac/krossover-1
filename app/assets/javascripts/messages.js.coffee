window.client = new Faye.Client('/faye')

client.addExtension {
  outgoing: (message, callback) ->
    message.ext = message.ext || {}
    message.ext.csrfToken = $('meta[name=csrf-token]').attr('content')
    callback(message)
}

jQuery ->
  $('#new_message').submit ->
    $(this).find("input[type='submit']").val('Sending...').prop('disabled', true)

  try
    client.unsubscribe '/messages'
  catch
    console?.log "Can't unsubscribe."

  client.subscribe '/messages', (payload) ->
    $('#comments').find('.media-list').prepend(payload.message) if payload.message