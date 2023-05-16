require 'rails_helper'

RSpec.describe 'Users', type: :system do
    let!(:user) do
        User.create(name: 'Tom', photo_url: 'https://images.unsplash.com/photo-1461948573049-a5ab4efb6150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2865&q=80',
                    bio: 'Teacher from Mexico.', posts_counter: 0)  
    end
    
    it 'should show the username' do
        visit '/'
        expect(page).to have_content(user.name) 
    end

    it 'should show the photo of all users' do
        visit '/'
        expect(page).to have_css("img[src*='#{user.photo_url}']")
    end

    it 'should show the number of posts of all users' do
        visit '/'
        expect(page).to have_content(user.posts_counter)
    end

    it 'redirect to another page when username clicked' do
        visit '/'
        click_link user.name
        expect(page).to have_current_path(user_path(user))
    end
end
