# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    alice = create(:user, email: 'alice@example.com')
    assert_equal 'alice@example.com', alice.name_or_email

    bob = create(:user, email: 'bob@example.com', name: 'Bob')
    assert_equal 'Bob', bob.name_or_email
  end
end
