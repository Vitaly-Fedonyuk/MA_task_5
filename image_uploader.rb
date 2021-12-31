# frozen_string_literal: true

require './url_validator'
require './faraday_request_wrapper'
require './request_wrapper'
require 'bundler'
Bundler.require(:default)

class ImageUploader
  def initialize(image_url)
    @image_url = image_url
  end

  def call
    validate ? upload : faraday_request
  end

  def faraday_request
    FaradayRequestWrapper.new(@image_url).call
  end

  def validate
    UrlValidator.new(@image_url).call
  end

  def upload
    RequestWrapper.new(Faraday.get(@image_url), @image_url).call
  end
end