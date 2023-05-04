class Comment < ApplicationRecord
    belongs_to :author, class_name: "User"
    belongs_to :post
    after_create :update_comment_counter

   # A method that updates the comments counter for a post.
    def update_comment_counter
        if self.post.comments_counter.nil?
            self.post.comments_counter = 1
        else
            self.post.comments_counter += 1
        end
        self.post.save
    end
end