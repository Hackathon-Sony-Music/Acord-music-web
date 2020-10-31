FactoryBot.define do
  factory :register_financeiro_provider, class: 'Register::Financeiro::Provider' do
    nme_provider { "MyString" }
    email { "MyString" }
    telephone { "MyString" }
    nme_empresa { "MyString" }
    description { "MyString" }
    obs { "MyString" }
  end
end
