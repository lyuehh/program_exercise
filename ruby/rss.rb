require 'open-uri'
require 'rss'

uri = "http://coolshell.cn/feed" #源地址

fetched_at = Time.at(0) #上次抓取时间

begin

    #URI.parse(uri).open("If-Modified-Since" => fetched_at.to_s(:rfc822)) do |io|
	URI.parse(uri).open("If-Modified-Since" => fetched_at.to_s()) do |io|

    	rss = RSS::Parser.parse io.read, false

    	rss.items.each do |item|

      		#puts item
			f = File.open("xx.html","w") do
				f.puts(time)
			end
    	end

    end

    rescue OpenURI::HTTPError => ex

      return if ex.io.status[0] == "304"

      #log bad uri and return

    return 

    #rescue Exception => e

      #log exception and return

    #return

end