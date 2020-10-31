require 'rails_helper'

RSpec.describe "files/files/index", type: :view do
  before(:each) do
    assign(:files_files, [
      Files::File.create!(
        data: "",
        filename: "Filename",
        mime_type: "Mime Type"
      ),
      Files::File.create!(
        data: "",
        filename: "Filename",
        mime_type: "Mime Type"
      )
    ])
  end

  it "renders a list of files/files" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "Filename".to_s, count: 2
    assert_select "tr>td", text: "Mime Type".to_s, count: 2
  end
end
