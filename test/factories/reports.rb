# frozen_string_literal: true

FactoryBot.define do
  factory :report do
    user
    title { '初日報' }
    content { 'テスト楽しい！' }

    trait :with_mention do
      title { 'メンション機能使ってみた' }
      content { 'http://localhost:3000/reports/1' }
    end
  end
end
