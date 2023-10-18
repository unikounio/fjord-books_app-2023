FactoryBot.define do
  factory :book_comment, class: Comment do
    user {User.find_by(email: 'alice@example.com')}
    association :commentable
    content {'マストバイ！'}
  end

  factory :report_comment, class: Comment do
    user {User.find_by(email: 'alice@example.com')}
    association :commentable
    content {'我ながら素晴らしい日報だ'}
  end
end
