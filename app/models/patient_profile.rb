class PatientProfile < ApplicationRecord
  belongs_to :user

  validates :full_name, :cpf, :phone, :birth_date, presence: true
end
