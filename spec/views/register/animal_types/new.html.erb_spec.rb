require 'rails_helper'

RSpec.describe "register/animal_types/new", type: :view do
  before(:each) do
    assign(:register_animal_type, Register::AnimalType.new(
      nme_animal: "MyString",
      obs: "MyString"
    ))
  end

  it "renders new register_animal_type form" do
    render

    assert_select "form[action=?][method=?]", register_animal_types_path, "post" do

      assert_select "input[name=?]", "register_animal_type[nme_animal]"

      assert_select "input[name=?]", "register_animal_type[obs]"
    end
  end
end
