# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = create(:daily_alice)
  end

  test '#editable?' do
    assert @report.editable?(User.find_by(email: 'alice@example.com'))
    assert_not @report.editable?(User.find_by(email: 'bob@example.com'))
  end

  test '#created_on' do
    fixed_time = Time.zone.local(2023, 10, 12, 20, 0, 0)
    @report.created_at = fixed_time
    assert_equal fixed_time.to_date, @report.created_on
  end
end
