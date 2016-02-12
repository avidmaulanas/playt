module PlaylistsHelper
	def playlist_info(playlist)
		content_tag :span,
		"by #{playlist.user.email} &bull; #{pluralize(playlist.videos.size-1, 'video')} &bull; #{playlist.privacy.titleize}".html_safe,
		class: "small text-muted"
	end
end
