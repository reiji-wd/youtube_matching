class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user

  has_many :favorites, dependent: :destroy
  after_create_commit { PostBroadcastJob.perform_later self }

  validates :content, length: { maximum: 255 }
  
  validates :content_or_image, presence: true
  private

  def content_or_image
    content.presence or image.presence
  end

end
