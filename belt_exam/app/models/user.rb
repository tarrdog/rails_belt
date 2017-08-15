class User < ApplicationRecord
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_secure_password
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :posts

  validates :name, :alias, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: email_regex }
  validates :password, length: { minimum: 8 }
end
