class RenameAccountIdBackToUserId < ActiveRecord::Migration[8.0]
  def change
    rename_column :patient_profiles, :account_id, :user_id
    rename_column :sessions, :account_id, :user_id
  end
end
