require 'rss'
require 'open-uri'

url = 'http://www.google.com/reader/atom/feed/http://www.gmazars.info/conf/rss/rss_builder.php%3Ffeed=gmazars.xml?n=100'
open(url) do |rss|
  feed = RSS::Parser.parse(rss)
  puts "Title: #{feed.channel.title}"

  puts feed.items.length
  # feed.items.each do |item|
  #   puts "Item: #{item.title}"
  # end

end
