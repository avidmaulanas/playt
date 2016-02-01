scrollUp = ->
  $(window).scroll ->
    if $(this).scrollTop() > 100
      $('.scrollup').fadeIn()
    else
      $('.scrollup').fadeOut()
    return
  $('.scrollup').click ->
    $('html, body').animate { scrollTop: 0 }, 600
    false
  return

$(document).ready ->
  $('[data-toggle="tooltip"]').tooltip();
  $('.scrollup').hide();
  scrollUp()
  return

$(document).bind "page:load page:change", ->
  scrollUp()
  return

$(document).ajaxSuccess ->
  $('[data-toggle="tooltip"]').tooltip();
  return
