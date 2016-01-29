class Video < ActiveRecord::Base
  YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  validates :link, presence: true, uniqueness: true, format: YT_LINK_FORMAT, length: { maximum: 43, message: "is invalid" }
end
