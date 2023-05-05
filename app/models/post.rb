class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  after_create :update_post_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  # update the post counter for the author of the post
  def update_post_counter
    if author.posts_counter.nil?
      author.posts_counter = 1
    else
      author.posts_counter += 1
    end
    author.save
  end

  # A method that returns the 5 most recent comments for a given post
  def recent_comments
    Comment.where('post_id = ?', id).order('created_at ASC').limit(5)
  end
end
