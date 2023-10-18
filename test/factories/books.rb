# frozen_string_literal: true

FactoryBot.define do
  factory :cherry_book, class: Book do
    title { 'プロを目指す人のためのRuby入門' }
    memo { '名著です！！' }
    author { 'jnchito' }
  end
end
