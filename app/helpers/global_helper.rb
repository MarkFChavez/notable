module GlobalHelper
  def gravatar(email, options = {})
    gravatar_image_tag(email, gravatar: options)
  end
end
