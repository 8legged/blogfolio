class PostPolicy
  attr_accessor :user, :post

  def initializer(user, post)
    @user = user
    @post = post
  end

  def publish?
    @user.role == "editor"
  end
end
