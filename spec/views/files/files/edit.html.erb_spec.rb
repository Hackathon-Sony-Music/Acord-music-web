require 'rails_helper'

RSpec.describe "files/files/edit", type: :view do
  before(:each) do
    @files_file = assign(:files_file, Files::File.create!(
      data: "",
      filename: "MyString",
      mime_type: "MyString"
    ))
  end

  it "renders the edit files_file form" do
    render

    assert_select "form[action=?][method=?]", files_file_path(@files_file), "post" do

      assert_select "input[name=?]", "files_file[data]"

      assert_select "input[name=?]", "files_file[filename]"

      assert_select "input[name=?]", "files_file[mime_type]"
    end
  end
end
