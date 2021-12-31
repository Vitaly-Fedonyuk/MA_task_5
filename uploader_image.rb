# frozen_string_literal: true

require './image_uploader'

class Read_line
  def read
    puts "Enter image url: "
    image_url = gets.chomp
  end
end

read_url = Read_line.new.read
ImageUploader.new(read_url).call

# Dir.mkdir create folder
# Dir['put'] if
