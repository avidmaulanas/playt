module VideosHelper
	def embed_video(youtube_id, options={})
		autoplay = options[:autoplay] ? 1 : 0;
    content_tag(:iframe, nil, 
    	src: "//www.youtube.com/embed/#{youtube_id}?version=3&enablejsapi=1&autoplay=#{autoplay};wmode=opaque",
    	frameborder: 0, 
    	id: "video-player",
    	data: {
    		video: youtube_id
    	}
    )
  end
end
