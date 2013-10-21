require 'nokogiri'
require 'pry'
require 'open-uri'

url1 = 'http://news.mtime.com/pix/2013/10/11/405742.html'
url2 = 'http://news.mtime.com/pix/2013/10/11/405749.html'

(405742..405749).to_a.each do |i|
    url  = "http://news.mtime.com/pix/2013/10/11/#{i}.html"
    doc = Nokogiri::HTML(open(url))
    puts doc.css('#textRegion')[0].text
end


