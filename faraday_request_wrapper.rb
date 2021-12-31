# frozen_string_literal: true

require './request_wrapper'
require 'bundler'
Bundler.require(:default)

class FaradayRequestWrapper
  include Faraday

  def initialize(img_url)
    @img_url = img_url
  end

  def call
    debugger
    begin
      Faraday.get(@image_url)
    rescue ConnectionFailed => e
      puts "Спораба пыдэднатися 1"
      puts "Спораба пыдэднатися 2"
      puts e.message
    rescue TimeoutError => e
      puts "Спораба пыдэднатися 1"
      puts "Спораба пыдэднатися 2"
      puts e.message
    rescue
      puts "Спораба пыдэднатися 1"
      puts "Спораба пыдэднатися 2"
      puts e.message
    end
  end
end