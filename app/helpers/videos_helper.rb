module VideosHelper
	def link_to_yt(video_id)
		# video_link.sub('watch?v=', 'embed/') + "?enablejsapi=1;wmode=opaque", class: "fancybox fancybox.iframe"
		"https://www.youtube.com/embed/#{video_id}?enablejsapi=1;wmode=opaque"
	end
end
