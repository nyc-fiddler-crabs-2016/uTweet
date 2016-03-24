class User < ActiveRecord::Base
  has_secure_password
  validates :email, :username, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  has_many :tweets, foreign_key: "poster_id", dependent: :destroy
  has_many :relationships, foreign_key: "follower_id"
  has_many :followers, through: :relationships, source: :follower
  has_many :followings, foreign_key: "followed_id", class_name: "Relationship"
  has_many :followed_users, through: :followings, source: :followed
end
