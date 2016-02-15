class PostsController
  def show_title_prompt
    view = GetTitle.new
    view.render
  end

  def create_new_post(user, title)
    post = Post.new(title)
    user.add_post(post)
    view = PostCreated.new
    view.render
  end

  def show_posts(user)
    if any_posts?(user)
      view = ShowPosts.new
      view.render(user)
    else
      no_posts_found
    end
  end

  def any_posts?(user)
    user.posts.size > 0
  end

  def no_posts_found
    view = NoPostsFound.new
    view.render
  end

  def show_user_prompt
    view = GetUser.new
    view.render
  end

  def show_posts_by_user(user_string)
    if user = user?(user_string)
      show_posts(user)
    else
      user_not_found
    end
  end

  def user?(user_string)
    User.users.find {|user_object| user_object.name == user_string.capitalize}
  end

  def user_not_found
    view = UserNotFound.new
    view.render
  end

  def show_post_by_title(user, title)
    if post = post_by_title?(user, title)
     view = PostFound.new
     view.render(post)
    else
      post_not_found
    end
  end

  def post_not_found
    view = PostNotFound.new
    view.render
  end

  def post_by_title?(user, title)
    user.posts.find {|post| post.title == title}
  end

  def delete_post_by_title(user, title)
    if post = post_by_title?(user, title)
      user.posts.delete(post)
      view = PostDeleted.new
      view.render
    else
      post_not_found
    end
  end

  def delete_all_posts(user)
    if any_posts?(user)
      user.posts.clear
      view = AllPostsDeleted.new
      view.render
    else
      no_posts_found
    end
  end
end