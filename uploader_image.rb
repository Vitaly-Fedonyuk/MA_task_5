# frozen_string_literal: true

require './image_uploader'

# Service that save image url
class Readline
  def read
    puts 'Enter image url: '
    gets.chomp
  end
end

read_url = Readline.new.read
ImageUploader.new(read_url).call

# Dir.mkdir create folder
# Dir['put'] if
