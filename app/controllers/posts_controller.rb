class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    if !current_user
      flash[:danger] = "You must login to create posts."
      redirect_to login_path 
    end
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))

    if @post.save
      flash[:success] = "Post was created."
      redirect_to root_url
    else
      render "new"
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :text, :user_id)
    end

end
