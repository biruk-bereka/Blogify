class User < ApplicationRecord
    has_many :posts, dependent: :delete_all, foreign_key: :author_id
    has_many :comments, dependent: :delete_all, foreign_key: :author_id
    has_many :likes, dependent: :delete_all, foreign_key: :author_id
    
    # A method that returns the 3 most recent posts for a given user
    def recent_posts
        Post.where("author_id = ?", self.id).order("created_at ASC").limit(3)
    end
end

