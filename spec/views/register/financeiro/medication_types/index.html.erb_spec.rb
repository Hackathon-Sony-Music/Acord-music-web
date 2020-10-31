require 'rails_helper'

RSpec.describe "register/financeiro/medication_types/index", type: :view do
  before(:each) do
    assign(:register_financeiro_medication_types, [
      Register::Financeiro::MedicationType.create!(
        nme_medication: "Nme Medication",
        description: "Description",
        obs: "Obs"
      ),
      Register::Financeiro::MedicationType.create!(
        nme_medication: "Nme Medication",
        description: "Description",
        obs: "Obs"
      )
    ])
  end

  it "renders a list of register/financeiro/medication_types" do
    render
    assert_select "tr>td", text: "Nme Medication".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "Obs".to_s, count: 2
  end
end
