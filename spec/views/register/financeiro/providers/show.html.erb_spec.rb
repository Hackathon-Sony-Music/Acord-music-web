require 'rails_helper'

RSpec.describe "register/financeiro/providers/show", type: :view do
  before(:each) do
    @register/financeiro_provider = assign(:register/financeiro_provider, Register::Financeiro::Provider.create!(
      nme_provider: "Nme Provider",
      email: "Email",
      telephone: "Telephone",
      nme_empresa: "Nme Empresa",
      description: "Description",
      obs: "Obs"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nme Provider/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Telephone/)
    expect(rendered).to match(/Nme Empresa/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Obs/)
  end
end
