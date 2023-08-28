# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create edit update destroy]

  def create
    comment = @commentable.comments.build(comment_params)
    comment.user = current_user
    flash[:alert] = comment.errors.full_messages.to_sentence unless comment.save
    redirect_to polymorphic_path(@commentable)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params) if comment.user == current_user
    redirect_to polymorphic_path(@commentable)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user == current_user
    redirect_to polymorphic_path(@commentable)
  end

  private

  def set_commentable
    @commentable =
      if params[:book_id]
        Book.find(params[:book_id])
      else
        Report.find(params[:report_id])
      end
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
