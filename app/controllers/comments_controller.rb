class CommentsController < ApplicationController
  before_action :set_commentable, only: [:create, :edit, :update, :destroy]

  def create
    comment = @commentable.comments.build(comment_params)
    comment.user = current_user
    if comment.save
      redirect_to polymorphic_path(@commentable)
    else
      flash[:alert] = comment.errors.full_messages.to_sentence
      redirect_to polymorphic_path(@commentable)
    end
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
    if params[:book_id]
      @commentable = Book.find(params[:book_id])
    else
      @commentable = Report.find(params[:report_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
