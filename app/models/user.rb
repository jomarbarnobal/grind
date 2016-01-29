class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend FriendlyId
  friendly_id :user_name, use: [:slugged, :finders]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :stories, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  def should_generate_new_friendly_id?
    new_record? || slug.nil? || slug.black?
  end
end
