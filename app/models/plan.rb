class Plan < ActiveRecord::Base
  has_many :subscriptions
  validates :amount, presence: true
end
