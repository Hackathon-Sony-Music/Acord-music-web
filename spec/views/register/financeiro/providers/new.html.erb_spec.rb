require 'rails_helper'

RSpec.describe "register/financeiro/providers/new", type: :view do
  before(:each) do
    assign(:register/financeiro_provider, Register::Financeiro::Provider.new(
      nme_provider: "MyString",
      email: "MyString",
      telephone: "MyString",
      nme_empresa: "MyString",
      description: "MyString",
      obs: "MyString"
    ))
  end

  it "renders new register/financeiro_provider form" do
    render

    assert_select "form[action=?][method=?]", register_financeiro_providers_path, "post" do

      assert_select "input[name=?]", "register/financeiro_provider[nme_provider]"

      assert_select "input[name=?]", "register/financeiro_provider[email]"

      assert_select "input[name=?]", "register/financeiro_provider[telephone]"

      assert_select "input[name=?]", "register/financeiro_provider[nme_empresa]"

      assert_select "input[name=?]", "register/financeiro_provider[description]"

      assert_select "input[name=?]", "register/financeiro_provider[obs]"
    end
  end
end
