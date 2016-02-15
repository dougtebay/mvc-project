class PostNewView
  def get_title
    print "\nTitle: "
    gets.chomp
  end

  def post_created
    puts "\nYour post has been added!\n"
  end

  def show_posts(user)
    puts; user.posts.each_with_index {|post, i| puts "Post #{i + 1}: #{post.title}"}
  end

  def no_posts_found
    puts "\nNo posts found.\n"
  end

  def get_user
    print "\nChoose a user: "
    user = gets.chomp
  end

  def user_not_found
    puts "\nUser not found."
  end

  def post_found(post)
    puts "\nFound: #{post.title}"
  end

  def post_not_found
    puts "\nPost not found."
  end

  def post_deleted
    puts "\nThis post has been deleted."
  end

  def all_posts_deleted
    puts "\nYour posts have been deleted."
  end
end