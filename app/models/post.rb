class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :hike, optional: true
  has_many :photos
end
