# frozen_string_literal: true

# Service that records the url in the file
class RequestWrapper
  def initialize(faraday_response, image_url)
    @faraday_response = faraday_response
    @image_url = image_url
  end

  def call
    puts 'You want enter image name? Yes or No'
    request_image = gets.chomp
    write_img(request_image)
  end

  def write_img(request_image)
    case request_image.capitalize
    when 'Yes'
      puts 'Enter image name:'
      image_name = gets.chomp
      File.open("#{image_name}.png", 'wb') { |fp| fp.write(@faraday_response.body) }
    when 'No'
      image_name = @image_url.split('/').sample
      File.open("#{image_name}.png", 'wb') { |fp| fp.write(@faraday_response.body) }
    end
  end
end
