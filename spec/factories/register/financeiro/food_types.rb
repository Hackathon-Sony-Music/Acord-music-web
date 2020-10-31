FactoryBot.define do
  factory :register_financeiro_food_type, class: 'Register::Financeiro::FoodType' do
    nme_food { "MyString" }
    description { "MyString" }
    obs { "MyString" }
  end
end
