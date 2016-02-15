class User
  attr_accessor :name
  attr_reader :posts
  @@users = []

  def initialize(name)
    @name = name
    @posts = []
    @@users << self
  end

  def add_post(post)
    self.posts << post
    post.user = self
  end

  def find_post_by_title(title)
    self.posts.select {|post| post.title == title}
  end

  def find_post_by_user_name(user_name)
    self.posts.select {|post| post.user.name == user_name}
  end

  def destroy_post_by_title(title)
    self.posts.delete {|post| post.title == title}
  end

  def destroy_all_posts
    self.posts.clear
  end

  def self.users
    @@users
  end
end