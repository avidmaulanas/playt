setContainer = ->
  $container = $('.infinite-scroll')

  $container.masonry
    itemSelector: '.video'
    columnWidth: '.video'


$(window).load ->
  setContainer() 
  return

$(window).ajaxSuccess ->
  setContainer() 
  return

$(document).ready ->
  setContainer()
  return

$(document).bind "page:load page:change", ->
  $container = $('.infinite-scroll')

  $container.masonry
    itemSelector: '.video'
    columnWidth: '.video'

  $container.infinitescroll {
    navSelector: '.pagination'
    nextSelector: '.pagination a'
    itemSelector: '.video'
    loading:
      msgText: ''
      finishedMsg: ''
      img: gon.ajax_loader_path

  }, (newElements) ->
    # hide new items while they are loading
    $newElems = $(newElements).css(opacity: 0)
    $newElems.animate opacity: 1
    $container.masonry 'appended', $newElems, true
    return
  return