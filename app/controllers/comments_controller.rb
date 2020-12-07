class CommentsController < ApplicationController
  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    @comment.user = current_user
      if @comment.save
        flash[:success] = 'Comment was successfully created.'
        redirect_to(@comment.post)
      else
        flash[:error] = "Error creating comment: #{@comment.errors}"
        redirect_to(@comment.post)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(@comment.post)
  end
end
