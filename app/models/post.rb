class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 255 }

  after_create_commit { PostBroadcastJob.perform_later self }
end
