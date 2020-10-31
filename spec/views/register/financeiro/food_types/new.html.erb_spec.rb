require 'rails_helper'

RSpec.describe "register/financeiro/food_types/new", type: :view do
  before(:each) do
    assign(:register/financeiro_food_type, Register::Financeiro::FoodType.new(
      nme_food: "MyString",
      description: "MyString",
      obs: "MyString"
    ))
  end

  it "renders new register/financeiro_food_type form" do
    render

    assert_select "form[action=?][method=?]", register_financeiro_food_types_path, "post" do

      assert_select "input[name=?]", "register/financeiro_food_type[nme_food]"

      assert_select "input[name=?]", "register/financeiro_food_type[description]"

      assert_select "input[name=?]", "register/financeiro_food_type[obs]"
    end
  end
end
