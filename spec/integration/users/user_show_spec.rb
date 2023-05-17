require 'rails_helper'
RSpec.describe 'Users', type: :system do
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
  it 'show the username of a user' do
    visit '/'
    click_link user.name
    expect(page).to have_content(user.name)
  end
  it 'show the photo of a user' do
    visit '/'
    click_link user.name
    expect(page).to have_css("img[src*='#{user.photo_url}']")
  end
  it 'show the number of posts of a user' do
    visit '/'
    click_link user.name
    expect(page).to have_content(user.posts_counter)
  end
  it 'should show the bio of a user' do
    visit '/'
    click_link user.name
    expect(page).to have_content(user.bio)
  end
  it 'should show the button to see all posts' do
    visit '/'
    click_link user.name
    expect(page).to have_button('Show all posts')
  end
  it 'should show the first 3 posts of a user' do
    visit '/'
    click_link user.name
    expect(page).to have_content(p0.title)
    expect(page).to have_content(p1.title)
    expect(page).to have_content(p2.title)
    expect(page).not_to have_content(p3.title)
  end
  it 'redirect to posts show page when post title clicked' do
    visit '/'
    click_link user.name
    click_link p0.title
    expect(page).to have_current_path(user_post_path(user_id: p0.author_id, id: p0.id))
  end
  it 'redirect to posts show page when show all posts button clicked' do
    visit '/'
    click_link user.name
    click_link 'Show all posts'
    expect(page).to have_current_path(user_posts_path(user))
  end
end
