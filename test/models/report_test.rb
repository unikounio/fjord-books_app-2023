# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @user = create(:user)
    @report = create(:report, user: @user)
  end

  test '#editable?' do
    assert @report.editable?(@user)
    assert_not @report.editable?(create(:user))
  end

  test '#created_on' do
    fixed_time = Time.zone.local(2023, 10, 12, 20, 0, 0)
    @report.created_at = fixed_time
    assert_equal Date.new(2023, 10, 12), @report.created_on
  end
end
