FactoryBot.define do
  factory :daily_alice, class: Report do
    user {create(:alice)}
    title {'初日報'}
    content {'テスト楽しい！'}
  end

  factory :daily_bob, class: Report do
    user {create(:bob)}
    title {'ボブ、大地に立つ'}
    content {'テスト素晴らしい！'}
  end
end
