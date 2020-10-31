module ApplicationHelper
  def time_sistem
    Time.now.strftime("%Y/%m/%d_%H:%M:%S")
  end

  def image_file(obj)
    "data:#{obj.mime_type};base64,#{Base64.strict_encode64(obj.data)}"
  end

  def image_user
    if current_user.files && current_user.files.data
      "data:#{current_user.files.mime_type};base64,#{Base64.strict_encode64(current_user.files.data)}"
    else
      root_url+asset_path('user_default.png')
    end
  end

  def name_user
    if current_user.user_name.present?
      current_user.user_name
    else
      current_user.email
    end
  end

end
