var player;

function onYouTubeIframeAPIReady() {
    player = new YT.Player('video-player', {
        events: {
          'onStateChange': onPlayerStateChange
        }
    });
}

var done = false;

function onPlayerStateChange(event) {
    console.log(event.data);
    if (event.data == YT.PlayerState.PLAYING && !done) {
        setTimeout(stopVideo, 6000);
        done = true;
    }
}

function stopVideo() {
    player.stopVideo();
}

$('.video-remove').on('click', function(){
    var id = $(this).data('video')
    $.ajax({
        url: "/videos/" + id,
        method: "DELETE",
        dataType: 'json',
        success: function(data){
            if (data.success){
                $(this).parents('.video-link').remove();
            }
        }
    });
});