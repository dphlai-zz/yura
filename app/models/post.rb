class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :hike, optional: true

  has_many :photos, dependent: :destroy

  has_and_belongs_to_many :liked_by_users, class_name: 'User'
end
