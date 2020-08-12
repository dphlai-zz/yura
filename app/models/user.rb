class User < ApplicationRecord
  has_many :posts
  has_many :hikes

  has_many :following_relationships, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :followed_relationships, class_name: 'Follow', foreign_key: 'followed_id'

  has_and_belongs_to_many :liked_posts, class_name: 'Post'

  has_secure_password

  validates :name, length: { minimum: 2, too_short: 'not long enough!'}
  validates :email, presence: true, uniqueness: true
end
