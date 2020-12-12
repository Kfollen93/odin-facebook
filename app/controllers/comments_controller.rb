class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.user_id = current_user.id
      if @comment.save
        flash[:success] = 'Comment was successfully created.'
        redirect_to posts_path
      else
        flash[:error] = "Error creating comment: #{@comment.errors}"
        redirect_to posts_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(@comment.post)
  end
end
