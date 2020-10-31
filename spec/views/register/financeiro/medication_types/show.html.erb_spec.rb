require 'rails_helper'

RSpec.describe "register/financeiro/medication_types/show", type: :view do
  before(:each) do
    @register/financeiro_medication_type = assign(:register/financeiro_medication_type, Register::Financeiro::MedicationType.create!(
      nme_medication: "Nme Medication",
      description: "Description",
      obs: "Obs"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nme Medication/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Obs/)
  end
end
