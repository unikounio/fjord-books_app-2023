# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = create(:alice)
    assert_equal 'alice@example.com', user.name_or_email

    user.name = 'Alice'
    assert_equal 'Alice', user.name_or_email
  end
end
