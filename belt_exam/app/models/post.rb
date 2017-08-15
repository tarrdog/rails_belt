class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :users_liked, through: :likes, source: :user

  validates :content, presence: true, length: { minimum: 10 }
end
