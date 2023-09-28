# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def create
    comment = commentable.comments.build(comment_params)
    comment.user = current_user
    if comment.save
      redirect_to polymorphic_path(commentable)
    else
      render 'comment', commentable:
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to polymorphic_path(commentable)
    else
      render 'comment', commentable:
    end
  end

  def destroy
    @comment.destroy
    redirect_to polymorphic_path(commentable)
  end

  private

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def commentable
    raise NotImplementedError
  end
end
