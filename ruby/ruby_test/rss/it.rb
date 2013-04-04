require "rss"
require "open-uri"
file2 = File.new("a.txt","w")
url= 'http://rss.xinhuanet.com/rss/it.xml'
open(url) do |h|
  resp = h.read
  result = RSS::Parser.parse(resp,false)
  result.items.each_with_index do |item,i|
    i += 1
    file2.puts "#{i}: #{item.title}"
    file2.puts "#{i}: #{item.author}"
    file2.puts "#{i}: #{item.link}"
    if i>5
      break
    end
  end
end
