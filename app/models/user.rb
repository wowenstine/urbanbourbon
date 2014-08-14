class User < ActiveRecord::Base
  has_many :bourbons
  has_many :comments
  has_one :subscription
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
