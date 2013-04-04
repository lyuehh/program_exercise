require "rss"
require "open-uri"
file2 = File.new("new.html","w")
file2.puts "<html>"
file2.puts "<head>"
file2.puts "<title>new</title>"
file2.puts "</head>"
file2.puts "<body>"
url= 'http://218.84.65.68/feed.asp'
open(url) do |h|
  resp = h.read
  result = RSS::Parser.parse(resp,false)
  result.items.each_with_index do |item,i|
    i += 1
    #file2.puts "#{i}: #{item.title},#{item.link}"
    file2.puts "<a href=#{item.link}>#{i}.#{item.title}</a><br />"
    #file2.puts "#{i}: #{item.author}"
    #file2.puts "#{i}: "
    if i>20
      break
    end
  end
end
file2.puts "</body>"
file2.puts "</html>"