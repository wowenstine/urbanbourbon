class Comment < ActiveRecord::Base
  belongs_to :bourbon
  belongs_to :user
end
