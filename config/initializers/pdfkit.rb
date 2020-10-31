# config/initializers/pdfkit.rb
PDFKit.configure do |config|

  config.default_options = {
      :encoding => "UTF-8",
      :page_size => "A4",
      :disable_smart_shrinking => false,
      :print_media_type => true,
      "load-error-handling" => 'ignore'
  }
  #config.verbose = false

  #config.wkhtmltopdf = 'which wkhtmltopdf'.to_s.strip
  #config.verbose = false
  #config.default_options[:ignore_load_errors] = true
  #config.wkhtmltopdf = 'which wkhtmltopdf'.gsub(/\n/, '')

  if RUBY_PLATFORM =~ /linux/
    wkhtmltopdf_executable = 'wkhtmltopdf-amd64'
    #config.wkhtmltopdf = '/../../lib/wkhtmltopdf_win64'
    config.wkhtmltopdf = "#{Rails.root}/lib/wkhtmltopdf_linux64/bin/wkhtmltopdf"
  elsif RUBY_PLATFORM =~ /x64-mingw32/
    #wkhtmltopdf_executable = 'wkhtmltopdf_win64'
    config.wkhtmltopdf = "#{Rails.root}/lib/wkhtmltopdf_win64/bin/wkhtmltopdf.exe"
    config.root_url = "http://localhost"
  elsif true

  else
    raise "Unsupported. Must be running linux or intel-based Mac OS."
  end

end

ActionController::Base.asset_host = Proc.new { |source, request|
  # if request.format.pdf?
  #   "#{request.protocol}#{request.host_with_port}"
  # else
  #   nil
  # end
}
