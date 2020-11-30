class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC") #this will need to become current_user's posts and their friends only.
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
        redirect_to posts_path
    else
        flash[:notice] = "Something went wrong...please try submitting again."
        redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end