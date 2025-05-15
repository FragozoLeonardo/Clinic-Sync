class CreatePatientProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :patient_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :full_name
      t.string :cpf
      t.string :phone
      t.date :birthday

      t.timestamps
    end
  end
end
