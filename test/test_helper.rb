# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Add more helper methods to be used by all tests here...
  include FactoryBot::Syntax::Methods

  # TODO: ログインユーザを限定せず、汎用的なメソッドにする
  # ログインするユーザは引数で渡す
  def login_as_user(email = 'foo@example.com', password = 'password')
    create(:user, email:, password:) unless User.exists?(email:)
    visit new_user_session_path
    fill_in 'Eメール', with: email
    fill_in 'パスワード', with: password
    click_on 'ログイン'
    assert_text 'ログインしました。'
  end
end
