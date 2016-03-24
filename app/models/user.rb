class User < ActiveRecord::Base
  has_secure_password
  validates :email, :username, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

end
