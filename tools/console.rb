require 'pry'
require_relative '../config/environment.rb'

# Seeding here because I couldn't get require/load seed.rb to work.
user = User.new("Doug")
user_two = User.new("Rosie")

puts "\nHi, #{user.name}. Welcome to Jabber!"
puts "\nType \'?\' for a list of commands."

loop do
  print "\nWhat do you want to do? "
  action = gets.chomp
  case action
  when '1'
    controller = PostsController.new
    title = controller.show_title_prompt
    controller = PostsController.new
    controller.create_new_post(user, title)
  when '2'
    controller = PostsController.new
    controller.show_posts(user)
  when '3'
    controller = PostsController.new
    user_string = controller.show_user_prompt
    controller = PostsController.new
    controller.show_posts_by_user(user_string)
  when '4'
    controller = PostsController.new
    title = controller.show_title_prompt
    controller = PostsController.new
    controller.show_post_by_title(user, title)
  when '5'
    controller = PostsController.new
    user_string = controller.show_user_prompt
    controller = PostsController.new
    if user_search = controller.user?(user_string)
      controller = PostsController.new
      title = controller.show_title_prompt
      controller = PostsController.new
      controller.show_post_by_title(user_search, title)
    else
      controller = PostsController.new
      controller.user_not_found
    end
  when '7'
    controller = PostsController.new
    title = controller.show_title_prompt
    controller = PostsController.new
    controller.delete_post_by_title(user, title)
  when '8'
    controller = PostsController.new
    controller.delete_all_posts(user)
  when '9'
    puts "\nGoodbye.\n\n"
    break
  when '?'
    puts "\n1. Make a new post."
    puts '2. View your posts.'
    puts '3. View another user\'s posts.'
    puts '4. Search your posts.'
    puts '5. Search all posts.'
    puts '6. Comment on a post.'
    puts '7. Delete a post.'
    puts '8. Delete all your posts.'
    puts '9. Leave Jabber.'
  else
    puts "\nCome again? Please enter \'?\' for a list of commands."
  end
end