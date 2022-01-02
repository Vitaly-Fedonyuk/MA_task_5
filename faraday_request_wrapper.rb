# frozen_string_literal: true

require './request_wrapper'
require 'bundler'
Bundler.require(:default)

# Service that handles the error
class FaradayRequestWrapper
  include Faraday

  def initialize(img_url)
    @img_url = img_url
  end

  def call
    exception
  end

  def exception
    Faraday.get(@image_url)
    rescue ConnectionFailed => e
      puts 'Спораба підєднатися 1...2'
      puts e.message
    rescue TimeoutError => e
      puts 'Спораба підєднатися 1...2'
      puts e.message
    rescue NilStatusError => e
      puts 'Спораба підєднатися 1...2'
      puts e.message
  end
end
