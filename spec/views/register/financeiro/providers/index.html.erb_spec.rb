require 'rails_helper'

RSpec.describe "register/financeiro/providers/index", type: :view do
  before(:each) do
    assign(:register_financeiro_providers, [
      Register::Financeiro::Provider.create!(
        nme_provider: "Nme Provider",
        email: "Email",
        telephone: "Telephone",
        nme_empresa: "Nme Empresa",
        description: "Description",
        obs: "Obs"
      ),
      Register::Financeiro::Provider.create!(
        nme_provider: "Nme Provider",
        email: "Email",
        telephone: "Telephone",
        nme_empresa: "Nme Empresa",
        description: "Description",
        obs: "Obs"
      )
    ])
  end

  it "renders a list of register/financeiro/providers" do
    render
    assert_select "tr>td", text: "Nme Provider".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Telephone".to_s, count: 2
    assert_select "tr>td", text: "Nme Empresa".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "Obs".to_s, count: 2
  end
end
