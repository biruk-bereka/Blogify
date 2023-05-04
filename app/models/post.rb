class Post < ApplicationRecord
    belongs_to :author, class_name: "User"
    has_many :comments, dependent: :delete_all
    has_many :likes, dependent: :delete_all
    after_create :update_post_counter

    # update the post counter for the author of the post
    def update_post_counter
        if self.author.posts_counter.nil?
            self.author.posts_counter = 1
        else
            self.author.posts_counter += 1
        end
        self.author.save
    end
    
    # A method that returns the 5 most recent comments for a given post
    def recent_comments
        Comment.where("post_id = ?", self.id).order("created_at ASC").limit(5)
    end
end
