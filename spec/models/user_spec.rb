require 'rails_helper'

describe User, type: :model do
    subject { User.new(name: 'John Doe', photo_url: 'https://www.google.com', bio: 'I am a person', posts_counter: 0)}
    
    before { subject.save }
    
    it 'name should be present' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'posts_counter should be greater than or equal to 0' do
        subject.posts_counter = -1
        expect(subject).to_not be_valid
    end
         
    it '#recent_posts returns the 3 most recent posts for a given user' do
        5.times do |i|
            subject.posts.create(title: "Post #{i}", text: "Body #{i}")
        end
        
        expect(subject.recent_posts).to eq(subject.posts.order('created_at ASC').limit(3))
    end
   
end