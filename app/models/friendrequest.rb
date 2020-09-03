class Friendrequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  after_create_commit { FriendRequestBroadcastJob.perform_later self }
end
