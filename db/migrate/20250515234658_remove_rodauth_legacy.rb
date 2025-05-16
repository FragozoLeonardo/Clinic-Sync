class RemoveRodauthLegacy < ActiveRecord::Migration[8.0]
  def change
    drop_table :account_login_change_keys, if_exists: true
    drop_table :account_password_reset_keys, if_exists: true
    drop_table :account_remember_keys, if_exists: true
    drop_table :account_verification_keys, if_exists: true
    drop_table :accounts, if_exists: true

    remove_foreign_key :patient_profiles, :users, if_exists: true
    remove_foreign_key :sessions, :users, if_exists: true
  end
end
