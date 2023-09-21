# frozen_string_literal: true

class Books::CommentsController < CommentsController
  private

  def commentable
    @commentable ||= Book.find(params[:book_id])
  end
end
