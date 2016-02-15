class Post
  attr_accessor :user
  attr_reader :title, :comments

  def initialize(title)
    @title = title
    @comments = []
  end

  def add_comment(comment)
    @comments << comment
    comment.post = self
  end
end