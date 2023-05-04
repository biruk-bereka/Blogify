class Like < ApplicationRecord
    belongs_to :author, class_name: "User"
    belongs_to :post
    after_create :like_counter

    # A method that updates the likes counter for a post.
    def like_counter 
        if self.post.likes_counter.nil? 
            self.post.likes_counter = 1
        else
            self.post.likes_counter += 1
        end
        self.post.save
    end
end