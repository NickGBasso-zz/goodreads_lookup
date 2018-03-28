require "goodreads_lookup/version"
require 'open-uri'
require 'nokogiri'

module GoodreadsLookup
  def getBook(isbn)
    goodReadsBook = Nokogiri.XML(open("https://www.goodreads.com/search/index.xml?key=IJIOijQmGxMt06aqcZOmmQ&q={#{isbn}}"))
    title = /<title>(.+?)<\/title>/.match(goodReadsBook.at_xpath("//title").to_s).captures[0]
    name = /<name>(.+?)<\/name>/.match(goodReadsBook.at_xpath("//name").to_s).captures[0]

    return "#{name} by #{title}"
  end
end
