class CommentsController < ApplicationController
  def create
    commentable_type = params[:comment][:commentable_type].constantize
    commentable = commentable_type.find(params[:comment][:commentable_id])
    comment = current_user.comments.new(comment_params)
    comment.save
    redirect_to polymorphic_path(commentable)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :commentable_type, :commentable_id)
  end
end
