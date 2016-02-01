class Playlist < ActiveRecord::Base
  belongs_to :user

  validates :name, :privacy, presence: true
  validates :name, length: { maximum: 30 }
end
