# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'プロを目指す人のためのRuby入門' }
    memo { '名著です！！' }
    author { 'jnchito' }
  end
end
