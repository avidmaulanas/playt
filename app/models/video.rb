class Video < ActiveRecord::Base
  YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  validates :link, presence: true, uniqueness: true, format: YT_LINK_FORMAT, length: { maximum: 43, message: "is invalid" }

  default_scope { order(created_at: :desc) }

  before_create :set_attributes

  def set_attributes
  	video = Yt::Video.new url: self.link
  	self.yt_id = video.id
  	self.title = video.title
    self.thumbnail_url = video.thumbnail_url(:medium)
  	self.channel_title = video.channel_title
  end
end
