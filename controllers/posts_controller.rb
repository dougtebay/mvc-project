class PostsController
  def show_title_prompt
    view = PostNewView.new
    view.get_title
  end

  def create_new_post(user, title)
    post = Post.new(title)
    user.add_post(post)
    view = PostNewView.new
    view.post_created
  end

  def show_posts(user)
    if any_posts?(user)
      view = PostNewView.new
      view.show_posts(user)
    else
      no_posts_found
    end
  end

  def any_posts?(user)
    user.posts.size > 0
  end

  def no_posts_found
    view = PostNewView.new
    view.no_posts_found
  end

  def show_user_prompt
    view = PostNewView.new
    view.get_user
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
    view = PostNewView.new
    view.user_not_found
  end

  def show_post_by_title(user, title)
    if post = post_by_title?(user, title)
     view = PostNewView.new
     view.post_found(post)
    else
      post_not_found
    end
  end

  def post_not_found
    view = PostNewView.new
    view.post_not_found
  end

  def post_by_title?(user, title)
    user.posts.find {|post| post.title == title}
  end

  def delete_post_by_title(user, title)
    if post = post_by_title?(user, title)
      user.posts.delete(post)
      view = PostNewView.new
      view.post_deleted
    else
      post_not_found
    end
  end

  def delete_all_posts(user)
    if any_posts?(user)
      user.posts.clear
      view = PostNewView.new
      view.all_posts_deleted
    else
      no_posts_found
    end
  end
end