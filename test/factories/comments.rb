# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    association :commentable

    trait :on_book do
      content { 'マストバイ！' }
    end

    trait :on_report do
      content { '我ながら素晴らしい日報だ' }
    end
  end
end
