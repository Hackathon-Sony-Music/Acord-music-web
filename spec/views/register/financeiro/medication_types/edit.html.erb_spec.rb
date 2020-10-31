require 'rails_helper'

RSpec.describe "register/financeiro/medication_types/edit", type: :view do
  before(:each) do
    @register/financeiro_medication_type = assign(:register/financeiro_medication_type, Register::Financeiro::MedicationType.create!(
      nme_medication: "MyString",
      description: "MyString",
      obs: "MyString"
    ))
  end

  it "renders the edit register/financeiro_medication_type form" do
    render

    assert_select "form[action=?][method=?]", register/financeiro_medication_type_path(@register/financeiro_medication_type), "post" do

      assert_select "input[name=?]", "register/financeiro_medication_type[nme_medication]"

      assert_select "input[name=?]", "register/financeiro_medication_type[description]"

      assert_select "input[name=?]", "register/financeiro_medication_type[obs]"
    end
  end
end
