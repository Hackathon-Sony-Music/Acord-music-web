require 'rails_helper'

RSpec.describe "register/animal_types/index", type: :view do
  before(:each) do
    assign(:register_animal_types, [
      Register::AnimalType.create!(
        nme_animal: "Nme Animal",
        obs: "Obs"
      ),
      Register::AnimalType.create!(
        nme_animal: "Nme Animal",
        obs: "Obs"
      )
    ])
  end

  it "renders a list of register/animal_types" do
    render
    assert_select "tr>td", text: "Nme Animal".to_s, count: 2
    assert_select "tr>td", text: "Obs".to_s, count: 2
  end
end
