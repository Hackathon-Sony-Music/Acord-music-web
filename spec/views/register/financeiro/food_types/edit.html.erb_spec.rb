require 'rails_helper'

RSpec.describe "register/financeiro/food_types/edit", type: :view do
  before(:each) do
    @register/financeiro_food_type = assign(:register/financeiro_food_type, Register::Financeiro::FoodType.create!(
      nme_food: "MyString",
      description: "MyString",
      obs: "MyString"
    ))
  end

  it "renders the edit register/financeiro_food_type form" do
    render

    assert_select "form[action=?][method=?]", register/financeiro_food_type_path(@register/financeiro_food_type), "post" do

      assert_select "input[name=?]", "register/financeiro_food_type[nme_food]"

      assert_select "input[name=?]", "register/financeiro_food_type[description]"

      assert_select "input[name=?]", "register/financeiro_food_type[obs]"
    end
  end
end
