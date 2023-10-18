# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = create(:report_alice)
    login_alice
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報の一覧'
  end

  test 'should create report' do
    visit reports_url
    click_on '日報の新規作成'

    fill_in 'タイトル', with: '２日目'
    fill_in '内容', with: 'すべて理解した！'
    click_on '登録する'

    assert_text '日報が作成されました'
    assert_text '２日目'
    assert_text 'すべて理解した！'
  end

  test 'should update Report' do
    visit report_url(@report)
    click_on 'この日報を編集'

    fill_in 'タイトル', with: '最初の日報'
    fill_in '内容', with: '今日からがんばるぞい'
    click_on '更新する'

    assert_text '日報が更新されました'
    assert_text '最初の日報'
    assert_text '今日からがんばるぞい'
  end

  test 'should destroy Report' do
    visit report_url(@report)
    click_on 'この日報を削除'

    assert_text '日報が削除されました。'
  end
end
