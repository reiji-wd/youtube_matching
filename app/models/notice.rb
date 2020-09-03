class Notice < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :reciever, class_name: 'User'

  after_create_commit { NoticeBroadcastJob.perform_later self }

end
