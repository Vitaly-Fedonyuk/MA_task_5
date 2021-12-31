# frozen_string_literal: true

class UrlValidator
  # клас що займається валідацією переданої в скріпт строки. Він повинен перевіряти, що:
  # - передана в скріпт строка являється урлою
  # - урла яка веде на імедж має розширення .jpeg, .png
  # В разі провалу валідації, в консоль потрібно вивеcти відповідний еррор месседж
  def initialize(url_img)
    @url_img = url_img
  end

  def call
    if validate_url_for_expansion? && if_this_url?
      true
    else
      puts "Its not url image"
      false
    end
  end

  def validate_url_for_expansion?
    case @url_img.split('.').last
    when "png"
      true
    when "jpg"
      true
    else
      false
    end
  end

  def if_this_url?
    @url_img.split(":").first == "https"
  end
end
