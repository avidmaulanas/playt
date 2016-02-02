module VideosHelper
	def link_to_yt(video_id)
		"https://www.youtube.com/embed/#{video_id}?enablejsapi=1;wmode=opaque"
	end
end
