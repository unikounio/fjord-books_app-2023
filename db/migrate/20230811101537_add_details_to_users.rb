class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :postal_code, :string
    add_column :users, :address, :string
    add_column :users, :about_me, :text
  end
end
