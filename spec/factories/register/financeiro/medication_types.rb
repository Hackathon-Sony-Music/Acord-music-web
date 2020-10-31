FactoryBot.define do
  factory :register_financeiro_medication_type, class: 'Register::Financeiro::MedicationType' do
    nme_medication { "MyString" }
    description { "MyString" }
    obs { "MyString" }
  end
end
