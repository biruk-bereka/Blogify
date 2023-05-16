require 'rails_helper'

RSpec.describe 'Posts', type: :system do
    let!(:user) do
        User.create(name: 'Tom', photo_url: 'https://images.unsplash.com/photo-1461948573049-a5ab4efb6150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2865&q=80',
                    bio: 'Teacher from Mexico.', posts_counter: 0)
    end
    
    5.times do |i|
        let!("p#{i}".to_sym) do
            Post.create(author_id: user.id, title: "Post #{i}", text: "Yes its just a test #{i}",
                        comments_counter: 0, likes_counter: 0)
        end
    end

    3.times do |i|
        let!("c#{i}".to_sym) do
            Comment.create(post_id: p0.id, author_id: user.id, text: "Comment #{i}")
        end
    end


    it 'should show the username, photo, number of post of a user and button to see all posts' do
        visit user_posts_path(user)
        # expect(page).to have_content(user.name) # show the username of a user
        # expect(page).to have_css("img[src*='#{user.photo_url}']") # show the photo of a user
        # expect(page).to have_content('Number of posts: 5') # show the number of posts of a user
        # expect(page).to have_content(user.bio) # show the post's title of a user
        # expect(page).to have_content(p0.title) # show the post's title of a user
        # expect(page).to have_content(p0.text) # show the post's text of a user
        # expect(page).to have_content('Comments: 3') # show the post's comments_counter of a user
        # expect(page).to have_content('Likes: 0') # show the post's likes_counter of a user
    end

    it 'should show the username of a user' do
        visit user_posts_path(user)
        expect(page).to have_content(user.name)
    end

    it 'should show the photo of a user' do
        visit user_posts_path(user)
        expect(page).to have_css("img[src*='#{user.photo_url}']")
    end

    it 'should show the number of posts of a user' do
        visit user_posts_path(user)
        expect(page).to have_content('Number of posts: 5')
    end

    it 'should show the post\'s title of a user' do
        visit user_posts_path(user)
        expect(page).to have_content(p0.title)
    end

    it 'should show the post\'s text of a user' do
        visit user_posts_path(user)
        expect(page).to have_content(p0.text)
    end

    it 'should show the post\'s comments_counter of a user' do
        visit user_posts_path(user)
        expect(page).to have_content('Comments: 3')
    end

    it 'should show the post\'s likes_counter of a user' do
        visit user_posts_path(user)
        expect(page).to have_content('Likes: 0')
    end
    
    it 'should have section for pagination if there are more posts than fit on the view' do
        visit user_posts_path(user)
        expect(page).to have_button('Next')
    end

    it 'redirect to user\'s posts page when click on the post\'s title' do
        visit user_posts_path(user)
        click_on(p0.title)
        expect(page).to have_current_path(user_post_path(user_id: p0.author_id, id: p0.id))
    end




    
end