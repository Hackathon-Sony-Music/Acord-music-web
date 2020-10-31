require 'rails_helper'

RSpec.describe "register/financeiro/medication_types/new", type: :view do
  before(:each) do
    assign(:register/financeiro_medication_type, Register::Financeiro::MedicationType.new(
      nme_medication: "MyString",
      description: "MyString",
      obs: "MyString"
    ))
  end

  it "renders new register/financeiro_medication_type form" do
    render

    assert_select "form[action=?][method=?]", register_financeiro_medication_types_path, "post" do

      assert_select "input[name=?]", "register/financeiro_medication_type[nme_medication]"

      assert_select "input[name=?]", "register/financeiro_medication_type[description]"

      assert_select "input[name=?]", "register/financeiro_medication_type[obs]"
    end
  end
end
