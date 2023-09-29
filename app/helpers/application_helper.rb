# frozen_string_literal: true

module ApplicationHelper
  # localeに応じて複数形の表記を変える
  # - 日本語の場合 => 本
  # - 英語の場合 => books
  def i18n_pluralize(word)
    I18n.locale == :ja ? word : word.pluralize
  end

  # localeに応じてエラー件数の表記を変える
  # - 日本語の場合 => 3件のエラー
  # - 英語の場合 => 3 errors
  def i18n_error_count(count)
    I18n.locale == :ja ? "#{count}件の#{t('views.common.error')}" : pluralize(count, t('views.common.error'))
  end

  def format_content(content)
    uri_reg = URI::DEFAULT_PARSER.make_regexp(%w[http https])
    content_with_line_breaks = safe_join(content.split("\n"), tag.br)
    linked_content = content_with_line_breaks.gsub(uri_reg) { link_to ::Regexp.last_match(0), ::Regexp.last_match(0) }
    sanitize(linked_content, tags: %w[a br], attributes: %w[href])
  end
end
