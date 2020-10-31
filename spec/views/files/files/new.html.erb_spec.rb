require 'rails_helper'

RSpec.describe "files/files/new", type: :view do
  before(:each) do
    assign(:files_file, Files::File.new(
      data: "",
      filename: "MyString",
      mime_type: "MyString"
    ))
  end

  it "renders new files_file form" do
    render

    assert_select "form[action=?][method=?]", files_files_path, "post" do

      assert_select "input[name=?]", "files_file[data]"

      assert_select "input[name=?]", "files_file[filename]"

      assert_select "input[name=?]", "files_file[mime_type]"
    end
  end
end
