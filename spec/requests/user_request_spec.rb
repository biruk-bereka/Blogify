require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) do
      get users_path
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    before(:each) do
      @first_user = User.create(name: 'Tom', photo_url: 'https://images.unsplash.com/photo-1461948573049-a5ab4efb6150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2865&q=80',
                                bio: 'Teacher from Mexico.', posts_counter: 0)
      get user_path(@first_user)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'returns correct body placeholder' do
      expect(response.body).to include(@first_user.name)
    end
  end
end