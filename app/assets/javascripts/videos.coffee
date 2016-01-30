# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Fires whenever a player has finished loading

onPlayerReady = (event) ->
  event.target.playVideo()
  return

# Fires when the player's state changes.

onPlayerStateChange = (event) ->
  # Go to the next video after the current one is finished playing
  if event.data == 0
    $.fancybox.prev()
  return

# The API will call this function when the page has finished downloading the JavaScript for the player API

onYouTubePlayerAPIReady = ->
  # Initialise the fancyBox after the DOM is loaded
  $(document).ready ->
    $('.fancybox').attr('rel', 'gallery').fancybox
      openEffect: 'none'
      closeEffect: 'none'
      nextEffect: 'none'
      prevEffect: 'none'
      padding: 0
      margin: 50
      fitToView: false
      maxWidth: "90%"
      maxHeigth: "90%"
      type: 'iframe'
      scrolling: 'no'
      iframe :
        scrolling : 'no'
        
      beforeShow: ->
        # Find the iframe ID
        id = $.fancybox.inner.find('iframe').attr('id')
        # Create video player object and add event listeners
        player = new (YT.Player)(id, events:
          'onReady': onPlayerReady
          'onStateChange': onPlayerStateChange)
        return
    return
  return

$(document).ready ->
  onYouTubePlayerAPIReady()
  return

$(document).bind "page:load page:change", -> 
  onYouTubePlayerAPIReady()
  return

$(document).ajaxSuccess ->
  onYouTubePlayerAPIReady()
  return