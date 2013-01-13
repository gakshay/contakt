class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company_name, :string
    add_column :users, :company_url, :string
    add_column :users, :name, :string
    add_index :users, :name, :unique => true
  end
end
