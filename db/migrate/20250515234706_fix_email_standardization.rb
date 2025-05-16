class FixEmailStandardization < ActiveRecord::Migration[8.0]
  def change
    rename_column :users, :email_address, :email

    change_column :users, :email, :citext

    add_index :users, :email, unique: true, name: 'index_users_on_unique_email'
  end
end
