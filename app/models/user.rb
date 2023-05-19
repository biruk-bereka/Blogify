require 'faker'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  before_create :set_auth_token
  before_create :set_profile
  
  has_many :posts, dependent: :delete_all, foreign_key: :author_id
  has_many :comments, dependent: :delete_all, foreign_key: :author_id
  has_many :likes, dependent: :delete_all, foreign_key: :author_id

  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }

  # A method that returns the 3 most recent posts for a given user
  def recent_posts
    Post.where('author_id = ?', id).order('created_at ASC').limit(3)
  end

  def set_auth_token
    loop do
      self.auth_token = SecureRandom.hex
      break unless User.exists?(auth_token:)
    end
  end

  def set_profile
    self.photo_url = Faker::Avatar.image
    self.bio = Faker::Job.title
  end
end
