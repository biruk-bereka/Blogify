class User < ApplicationRecord
  has_many :posts, dependent: :delete_all, foreign_key: :author_id
  has_many :comments, dependent: :delete_all, foreign_key: :author_id
  has_many :likes, dependent: :delete_all, foreign_key: :author_id

  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }

  # A method that returns the 3 most recent posts for a given user
  def recent_posts
    Post.where('author_id = ?', id).order('created_at ASC').limit(3)
  end
end
