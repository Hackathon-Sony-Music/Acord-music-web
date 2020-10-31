require 'rails_helper'

RSpec.describe "register/animal_types/edit", type: :view do
  before(:each) do
    @register_animal_type = assign(:register_animal_type, Register::AnimalType.create!(
      nme_animal: "MyString",
      obs: "MyString"
    ))
  end

  it "renders the edit register_animal_type form" do
    render

    assert_select "form[action=?][method=?]", register_animal_type_path(@register_animal_type), "post" do

      assert_select "input[name=?]", "register_animal_type[nme_animal]"

      assert_select "input[name=?]", "register_animal_type[obs]"
    end
  end
end
