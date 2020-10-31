require 'rails_helper'

RSpec.describe "register/financeiro/providers/edit", type: :view do
  before(:each) do
    @register/financeiro_provider = assign(:register/financeiro_provider, Register::Financeiro::Provider.create!(
      nme_provider: "MyString",
      email: "MyString",
      telephone: "MyString",
      nme_empresa: "MyString",
      description: "MyString",
      obs: "MyString"
    ))
  end

  it "renders the edit register/financeiro_provider form" do
    render

    assert_select "form[action=?][method=?]", register/financeiro_provider_path(@register/financeiro_provider), "post" do

      assert_select "input[name=?]", "register/financeiro_provider[nme_provider]"

      assert_select "input[name=?]", "register/financeiro_provider[email]"

      assert_select "input[name=?]", "register/financeiro_provider[telephone]"

      assert_select "input[name=?]", "register/financeiro_provider[nme_empresa]"

      assert_select "input[name=?]", "register/financeiro_provider[description]"

      assert_select "input[name=?]", "register/financeiro_provider[obs]"
    end
  end
end
