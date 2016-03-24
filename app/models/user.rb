class User < ActiveRecord::Base
  has_secure_password
  validates :email, :username, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  has_many :tweets, foreign_key: "poster_id"
  has_many :followers, through: :relationships, source: :follower
  has_many :followed_users, through: :relationships, source: :followed
end
