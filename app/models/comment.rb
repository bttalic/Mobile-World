class Comment < ActiveRecord::Base
  attr_accessible :content, :phone_id, :user_id

  belongs_to :user
  belongs_to :phone

  validates :content, :presence => true
  validates :content, length: {minimum: 2, maximum: 100}
end
