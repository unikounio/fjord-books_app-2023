# frozen_string_literal: true

require 'test_helper'

class ReportMentionTest < ActiveSupport::TestCase
  test 'create_mentions' do
    create(:report_alice)

    assert_difference 'ReportMention.count' do
      create(:mentioning_report)
    end
    
    assert_no_difference 'ReportMention.count' do
      create(:no_mention_report)
    end
  end
end
