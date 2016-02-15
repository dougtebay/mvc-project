class ShowPosts
  def render(user)
    puts; user.posts.each_with_index {|post, i| puts "Post #{i + 1}: #{post.title}"}
  end
end