# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  setup do
    @user = create(:user)
    @book = create(:book)
    @report = create(:report, user: @user)
    login_as_user(@user)
  end

  test 'should create Comment for book' do
    visit book_url(@book)
    fill_in 'comment_content', with: 'ネ申ブック'
    click_on 'コメントする'
    assert_text 'コメントが作成されました。'
    assert_text 'ネ申ブック'
  end

  test 'should destroy Comment for Book' do
    create(:comment, :on_book, user: @user, commentable: @book)
    visit book_url(@book)
    assert_text 'マストバイ！'
    click_on '削除'
    page.accept_alert
    assert_text 'コメントが削除されました。'
  end

  test 'should create Comment for Report' do
    visit report_url(@report)
    fill_in 'comment_content', with: '自演なう！'
    click_on 'コメントする'
    assert_text 'コメントが作成されました。'
    assert_text '自演なう！'
  end

  test 'should destroy Comment for Report' do
    create(:comment, :on_report, user: @user, commentable: @report)
    visit report_url(@report)
    assert_text '我ながら素晴らしい日報だ'
    click_on '削除'
    page.accept_alert
    assert_text 'コメントが削除されました。'
  end
end
