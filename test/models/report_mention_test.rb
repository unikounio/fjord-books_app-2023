# frozen_string_literal: true

require 'test_helper'

class ReportMentionTest < ActiveSupport::TestCase
  test 'create_mentions' do
    assert_no_difference 'ReportMention.count' do
      create(:report)
    end

    assert_difference 'ReportMention.count' do
      create(:report, :with_mention, user: User.find_by(email: 'foo@example.com'))
    end
  end
end
