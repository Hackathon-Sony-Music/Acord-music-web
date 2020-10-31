json.extract! files_file, :id, :data, :filename, :mime_type, :created_at, :updated_at
json.url files_file_url(files_file, format: :json)
