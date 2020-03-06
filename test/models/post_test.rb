require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = User.new(id: 1, name: "bobbby", email: "boobbbby@mail.com", password: "beebee", password_confirmation: "beebee")
    @user.save
    @post = Post.new(title: "Post title", text: "Post text", user_id: 1)
  end
  
  test "valid post" do
    assert @post.valid?
  end

  test "title is present" do
    @post.title = "      "
    assert_not @post.valid?
  end

  test "title is not too long" do
    @post.title = "a" * 81
    assert_not @post.valid?
  end

  test "title is not too short" do
    @post.title = "a" * 4
    assert_not @post.valid?
  end

  test "text is present" do
    @post.text = "      "
    assert_not @post.valid?
  end

  test "text is not too long" do
    @post.text = "a" * 321
    assert_not @post.valid?
  end

  test "user exists" do
    @post.user_id = nil
    assert_not @post.valid?
  end

end
