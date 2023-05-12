# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

first_user = User.create(name: 'Tom', photo_url: 'https://images.unsplash.com/photo-1461948573049-a5ab4efb6150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2865&q=80',
    bio: 'Teacher from Mexico.', posts_counter: 0)

second_user = User.create(name: 'Lilly', photo_url: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2432&q=80',
bio: 'Teacher from Poland.', posts_counter: 0)
puts '2 Users Created!'
# Create at least 4 posts written by one of the users you created by running the following code:
(1..4).each do |i|
Post.create(author: first_user, title: "Tom post #{i}.", text: "Post #{i} by Tom.",
comments_counter: 0, likes_counter: 0)
end
(1..2).each do |i|
Post.create(author: second_user, title: "Lilly post #{i}.", text: "Post #{i} by Lilly.",
comments_counter: 0, likes_counter: 0)
end
puts 'Posts Created!'

# Create at least 6 posts comments for one of the posts you created by running the following code:
first_post = Post.first
(1..6).each do |i|
Comment.create(post: first_post, author: second_user, text: "Hi Tom! My #{i} comment" )
end
puts 'Comment created!'
