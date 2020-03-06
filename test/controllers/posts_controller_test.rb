require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:member)
    @post = posts(:post)
  end

  test "should display incorrect author names for posts when not logged in" do 
    get root_url
    assert_select "span", "Posted by Sally Slappers"
  end
  
  test "should display correct author names for posts when logged in" do 
    log_in_as(@user)
    get root_url
    assert_select "span", "Posted by #{@post.user.name}"
  end

  test "should redirect to login when trying to create post" do
    get new_post_url
    assert_not flash.empty?
  end

  test "should allow logged in user to create new post" do
    log_in_as(@user)
    get new_post_url
    assert_select "form"
  end

end
