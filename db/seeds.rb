require 'nokogiri'
require 'open-uri'
require_relative '../app/models/category'
require_relative '../app/models/phrase'

#around the house
around_the_house = Nokogiri::HTML(open("http://www.justin.my/2012/07/wheel-of-fortune-solver/2/"))

category_one = Category.create(name: "Around the House")

around_the_house.css('ol li').each do |element|
  Phrase.create(phrase: element.text, category_id: category_one.id)
end

#author/title
living_things = Nokogiri::HTML(open("http://www.justin.my/2012/07/wheel-of-fortune-solver/16/"))

category_two = Category.create(name: "Living Things")

living_things.css('ol li').each do |element|
  Phrase.create(phrase: element.text, category_id: category_two.id)
end


#classic movies
what_are_you_doing = Nokogiri::HTML(open("http://www.justin.my/2012/07/wheel-of-fortune-solver/40/"))

category_three = Category.create(name: "What Are You Doing?")

what_are_you_doing.css('ol li').each do |element|
  Phrase.create(phrase: element.text, category_id: category_three.id)
end


