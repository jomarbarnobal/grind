class Story < ActiveRecord::Base
  extend FriendlyId
  friendly_id :story_title, use: :slugged

  belongs_to :user

  has_many :comments, as: :commentable, dependent: :destroy
end
