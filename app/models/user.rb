class User < ApplicationRecord
  # mount_uploader :image, ImageUploader

  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true, length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :posts, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :likes_youtuber, through: :likes, source: :youtuber

  has_many :friendrequests, dependent: :destroy
  has_many :requestfriend, through: :friendrequests, source: :friend

  has_many :relationships, dependent: :destroy
  has_many :friends, through: :relationships, source: :friend
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'friend_id'
  has_many :otherfriends, through: :reverses_of_relationship, source: :user

  has_many :notices, dependent: :destroy
  has_many :notices_sender, through: :notice, source: :sender

  has_many :rooms, dependent: :destroy

  has_many :messages, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorites_post, through: :favorites, source: :post

  def like(youtuber)
      self.likes.find_or_create_by(youtuber_id: youtuber.id)
  end

  def unlike(youtuber)
    like = self.likes.find_by(youtuber_id: youtuber.id)
    like.destroy if like
  end

  def like?(youtuber)
    self.likes_youtuber.include?(youtuber)
  end

  def friendrequest(friend)
    self.friendrequests.find_or_create_by(friend_id: friend.id)
  end

  def unrequest(friend)
    request = self.friendrequests.find_by(friend_id: friend.id)
    request.destroy if request
  end

  def request?(friend)
    self.requestfriend.include?(friend)
  end

  def friend(user)
    unless  self.friends.include?(user) && self.otherfriends.include?(user)
      self.relationships.create(friend_id: user.id)
    end
  end

  def friend?(user)
    self.friends.include?(user)
  end

  def otherfriend?(user)
    self.otherfriends.include?(user)
  end

  def favorite(post)
    self.favorites.find_or_create_by(post_id: post.id)
  end

  def unfavorite(post)
    favorite = self.favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end

  def favorite?(post)
    self.favorites_post.include?(post)
  end

end
