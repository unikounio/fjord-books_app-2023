# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  validates :comment, presence: true
  
  def display_name_or_email
    if self.user.name.present?
      self.user.name
    else
      self.user.email
    end
  end
end
