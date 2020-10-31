require 'rails_helper'

RSpec.describe "files/files/show", type: :view do
  before(:each) do
    @files_file = assign(:files_file, Files::File.create!(
      data: "",
      filename: "Filename",
      mime_type: "Mime Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Filename/)
    expect(rendered).to match(/Mime Type/)
  end
end
