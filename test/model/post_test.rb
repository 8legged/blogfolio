require "minitest_helper"

class PostTest < MiniTest::Unit::TestCase
  def test_to_param
    post = Post.create!(title: "Hi")
    assert_equal "#{post.id}-hi", post.to_param
  end
end
