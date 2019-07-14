class Message < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, unless: :image?
  validates :content, presence: true, unless: :video?
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
end
