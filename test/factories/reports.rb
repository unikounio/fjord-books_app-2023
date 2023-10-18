# frozen_string_literal: true

FactoryBot.define do
  factory :report_alice, class: Report do
    user { create(:alice) }
    title { '初日報' }
    content { 'テスト楽しい！' }
  end

  factory :mentioning_report, class: Report do
    user { User.find_by(email: 'alice@example.com') }
    title { 'メンション機能使ってみた' }
    content { 'http://localhost:3000/reports/1' }
  end

  factory :no_mention_report, class: Report do
    user { User.find_by(email: 'alice@example.com') }
    title { 'メンション機能ってなに？' }
    content { 'おいしいの？' }
  end
end
