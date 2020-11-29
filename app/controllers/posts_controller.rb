class PostsController < ApplicationController
  def index
    @posts = Post.all #this will need to become current_user's posts and their friends only.
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect to @post
    else
      render 'new'
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end