FactoryBot.define do
  factory :register_animal_type, class: 'Register::AnimalType' do
    nme_animal { "MyString" }
    obs { "MyString" }
  end
end
