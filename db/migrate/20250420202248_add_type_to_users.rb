class AddTypeToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :type, :string, null: false, default: "Admin"
  end
end
