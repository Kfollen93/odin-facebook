class PostsController < ApplicationController
  def index
    @posts = Post.includes(:comments).all.order("created_at DESC") #this will need to become current_user's posts and their friends only.
    @comments = Comment.all.order("created_at DESC")
    @user = current_user
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash[:error] = "Something went wrong...please try submitting again."
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end