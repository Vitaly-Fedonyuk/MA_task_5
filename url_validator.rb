# frozen_string_literal: true

# Service that validate the url
class UrlValidator
  def initialize(url_img)
    @url_img = url_img
  end

  def call
    if validate_url_for_expansion? && if_this_url?
      true
    else
      puts 'Its not url image'
      false
    end
  end

  def validate_url_for_expansion?
    case @url_img.split('.').last
    when 'png'
      true
    when 'jpg'
      true
    else
      false
    end
  end

  def if_this_url?
    @url_img.split(':').first == 'https'
  end
end
