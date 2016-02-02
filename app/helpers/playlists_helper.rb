module PlaylistsHelper
	def playlist_info(playlist)
		"by #{playlist.user.email} &bull; #{pluralize(playlist.videos.size, 'video')} &bull; #{playlist.privacy.titleize}".html_safe
	end
end
