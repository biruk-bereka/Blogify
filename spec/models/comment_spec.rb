require 'rails_helper'

describe Comment, type: :model do
    subject { Comment.new(text: 'Comment Body')}

    before { subject.save }

    it 'text should be present' do
        subject.text = nil
        expect(subject).to_not be_valid
    end

    it '#update_comment_counter should increment the comments_counter of the post' do
        author = User.create(name: 'John Doe', photo_url: 'https://www.google.com', bio: 'I am a person', posts_counter: 0)
        post = author.posts.create(title: 'Post Title', text: 'Post Body', comments_counter: 0, likes_counter: 0)
        comment = post.comments.create(text: 'Comment Body')
        post.save
        expect(post.comments.length).to eq(1)
    end
end