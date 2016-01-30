$(document).ready ->
  $('[data-toggle="tooltip"]').tooltip();
  $('.scrollup').hide();
  
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

$(document).ajaxSuccess ->
  $('[data-toggle="tooltip"]').tooltip();