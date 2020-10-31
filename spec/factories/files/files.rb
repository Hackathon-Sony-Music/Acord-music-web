FactoryBot.define do
  factory :files_file, class: 'Files::File' do
    data { "" }
    filename { "MyString" }
    mime_type { "MyString" }
  end
end
