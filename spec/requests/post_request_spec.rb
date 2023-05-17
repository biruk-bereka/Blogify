require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      @first_user = User.create(name: 'Tom', photo_url: 'https://images.unsplash.com/photo-1461948573049-a5ab4efb6150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2865&q=80',
                                bio: 'Teacher from Mexico.', posts_counter: 0)
      @post_one = Post.create(author: @first_user, title: 'Tom post 1.', text: 'Post 1 by Tom.',
                              comments_counter: 0, likes_counter: 0)
      get user_posts_path(@first_user)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  
    it 'returns correct body placeholder' do
      expect(response.body).to include(@first_user.name)
    end
  end

  describe 'GET /show' do
    before(:each) do
      @first_user = User.create(name: 'Tom', photo_url: 'https://images.unsplash.com/photo-1461948573049-a5ab4efb6150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2865&q=80',
                                bio: 'Teacher from Mexico.', posts_counter: 0)
      @post_one = Post.create(author: @first_user, title: 'Tom post 1.', text: 'Post 1 by Tom.',
                              comments_counter: 0, likes_counter: 0)
      get user_post_path(user_id: @post_one.author_id, id:@post_one.id)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  
    it 'returns correct body placeholder' do
      expect(response.body).to include(@first_user.name)
    end
  end
end