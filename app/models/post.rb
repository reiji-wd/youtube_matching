class Post < ApplicationRecord
  belongs_to :user
  
  has_many :favorites, dependent: :destroy

  validates :content, presence: true, length: { maximum: 255 }

  after_create_commit { PostBroadcastJob.perform_later self }
end
