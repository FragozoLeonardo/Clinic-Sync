FactoryBot.define do
  factory :patient_profile do
    user { nil }
    full_name { "MyString" }
    cpf { "MyString" }
    phone { "MyString" }
    birthday { "2025-05-14" }
  end
end
