require 'rails_helper'

RSpec.describe "register/financeiro/food_types/show", type: :view do
  before(:each) do
    @register/financeiro_food_type = assign(:register/financeiro_food_type, Register::Financeiro::FoodType.create!(
      nme_food: "Nme Food",
      description: "Description",
      obs: "Obs"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nme Food/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Obs/)
  end
end
