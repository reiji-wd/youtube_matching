class Youtuber < ApplicationRecord
  has_many :likes, dependent: :destroy
end
