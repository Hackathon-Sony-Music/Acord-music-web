require 'rails_helper'

RSpec.describe "register/financeiro/food_types/index", type: :view do
  before(:each) do
    assign(:register_financeiro_food_types, [
      Register::Financeiro::FoodType.create!(
        nme_food: "Nme Food",
        description: "Description",
        obs: "Obs"
      ),
      Register::Financeiro::FoodType.create!(
        nme_food: "Nme Food",
        description: "Description",
        obs: "Obs"
      )
    ])
  end

  it "renders a list of register/financeiro/food_types" do
    render
    assert_select "tr>td", text: "Nme Food".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "Obs".to_s, count: 2
  end
end
