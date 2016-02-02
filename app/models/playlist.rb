class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :videos

  validates :name, :privacy, presence: true
  validates :name, length: { maximum: 30 }

  scope :current_user, -> { where(user_id: User.current.id) }
  scope :privacy_public, -> { where(privacy: "public") }
  scope :privacy_private, -> { where(privacy: "private") }
end
