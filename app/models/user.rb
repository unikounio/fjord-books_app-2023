# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :icon do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  validate :icon_type

  private

  def icon_type
    return if icon.blob.content_type.in?(%w[image/jpeg image/png image/gif])

    icon.purge
    errors.add(:icon_image, 'はjpg, png, gif形式のいずれかでアップロードしてください')
  end
end
