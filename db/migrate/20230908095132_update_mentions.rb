class UpdateMentions < ActiveRecord::Migration[7.0]
  def change
    change_column_null :mentions, :mentioning_report_id, false
    change_column_null :mentions, :mentioned_report_id, false
    add_index :mentions, [:mentioning_report_id, :mentioned_report_id], unique: true
  end
end
