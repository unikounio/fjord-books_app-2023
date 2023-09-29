# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :commentable

  def create
    comment = @commentable.comments.build(comment_params)
    comment.user = current_user
    if comment.save
      redirect_to polymorphic_path(@commentable)
    elsif @commentable.is_a?(Book)
      @book = @commentable
      render 'books/show'
    else
      @report = @commentable
      render 'reports/show'
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to polymorphic_path(@commentable)
    else
      render '_comment', locals: { commentable: @commentable }
    end
  end

  def destroy
    @comment.destroy
    redirect_to polymorphic_path(@commentable)
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
