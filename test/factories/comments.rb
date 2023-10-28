# frozen_string_literal: true

FactoryBot.define do
  # TODO: 同様の書き方をしてる箇所がないか確認して修正する。
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
