require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  let!(:user) do
    User.create(name: 'Tom', photo_url: 'https://images.unsplash.com/photo-1461948573049-a5ab4efb6150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2865&q=80',
                bio: 'Teacher from Mexico.', posts_counter: 0)
  end

  let!(:user2) do
    User.create(name: 'Jerry', photo_url: 'https://images.unsplash.com/photo-1461948573049-a5ab4efb6150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2865&q=80',
                bio: 'Teacher from Mexico.', posts_counter: 0)
  end

  let!(:post) do
    Post.create(author_id: user.id, title: 'Post 1', text: 'Yes its just a test',
                comments_counter: 0, likes_counter: 0)
  end

  let!(:comment) do
    Comment.create(post_id: post.id, author_id: user2.id, text: 'Comment 1')
  end

  it 'should the post\'s title' do
    visit user_post_path(post)
    expect(page).to have_content(post.title)
  end

  it 'should show who is the author of the post' do
    visit user_post_path(post)
    expect(page).to have_content(user.name)
  end

  it 'should show how many comments the post has' do
    visit user_post_path(post)
    expect(page).to have_content('Comments:1')
  end

  it 'should show how many likes the post has' do
    visit user_post_path(post)
    expect(page).to have_content('Likes: 0')
  end

  it 'should show the post\'s text' do
    visit user_post_path(post)
    expect(page).to have_content(post.text)
  end

  it 'should show the username of the comment\'s author' do
    visit user_post_path(post)
    expect(page).to have_content('Jerry')
  end

  it 'should show the comment\'s text' do
    visit user_post_path(post)
    expect(page).to have_content(comment.text)
  end

  it 'should show the comment of each commentor left' do
    visit user_post_path(post)
    expect(page).to have_content("#{user2.name}:\n#{comment.text}")
  end
end
