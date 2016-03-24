class User < ActiveRecord::Base
  has_secure_password
  validates :email, :username, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  has_many :tweets, foreign_key: "poster_id", dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  
  has_many :followings, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :follows, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy

  has_many :following, through: :followings, source: :followed
  has_many :followers, through: :follows, source: :follower

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end
end
