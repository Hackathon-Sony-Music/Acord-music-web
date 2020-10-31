require 'rails_helper'

RSpec.describe "register/animal_types/show", type: :view do
  before(:each) do
    @register_animal_type = assign(:register_animal_type, Register::AnimalType.create!(
      nme_animal: "Nme Animal",
      obs: "Obs"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nme Animal/)
    expect(rendered).to match(/Obs/)
  end
end
