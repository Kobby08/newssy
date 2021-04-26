require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  def scrape
    url = URI.open('https://www.newsnow.co.uk/h/')
    doc = Nokogiri.HTML(url)
    newsfeeds = doc.css('.newsfeed').css('.hll')
    news = []
    newsfeeds.each do |n|
      title = n.text
      url = n.attribute('href').value
      news_hash = { title: title, url: url }
      news << news_hash
    end

    news
  end
end
