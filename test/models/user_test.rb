# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = create(:user)
    assert_equal user.email, user.name_or_email

    user.name = 'Foo'
    assert_equal user.name, user.name_or_email
  end
end
