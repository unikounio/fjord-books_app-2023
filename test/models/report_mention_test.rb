# frozen_string_literal: true

require 'test_helper'

class ReportMentionTest < ActiveSupport::TestCase
  test 'create_mentions' do
    assert_no_difference 'ReportMention.count' do
      create(:report)
    end

    assert_difference 'ReportMention.count' do
      user = create(:user)
      create(:report, :with_mention, user:)
    end
  end
end
