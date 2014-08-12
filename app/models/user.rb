class User < ActiveRecord::Base
  has_many :bourbons
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
