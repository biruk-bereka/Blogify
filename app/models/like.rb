class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_create :like_counter

  # A method that updates the likes counter for a post.
  def like_counter
    if post.likes_counter.nil?
      post.likes_counter = 1
    else
      post.likes_counter += 1
    end
    post.save
  end
end
