require 'rails_helper'

describe Post, type: :model do
    subject { Post.new(title: 'Post Title', text: 'Post Body', comments_counter: 0, likes_counter: 0)}

    before { subject.save }

    it 'title should be present' do
        subject.title = nil
        expect(subject).to_not be_valid
    end 

    it 'title should not be longer than 250 characters' do
        subject.title = 'a' * 251
        expect(subject).to_not be_valid
    end

    it 'comments_counter should be greater than or equal to 0' do
        subject.comments_counter = -1
        expect(subject).to_not be_valid
    end

    it 'likes_counter should be greater than or equal to 0' do  
        subject.likes_counter = -1
        expect(subject).to_not be_valid
    end

    it '#update_post_counter should increment the posts_counter of the author of the post' do
        author = User.create(name: 'John Doe', photo_url: 'https://www.google.com', bio: 'I am a person', posts_counter: 0)
        post = author.posts.create(title: 'Post Title', text: 'Post Body', comments_counter: 0, likes_counter: 0)
        author.save
        expect(author.posts.length).to eq(1)
    end
end