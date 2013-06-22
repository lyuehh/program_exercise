
require "open-uri"
require "erb"
include ERB::Util

#puts "Please enter the search words:"
#query = gets
#puts "How many results do you want?(default 10)"
#num = gets
query,num = ARGV

equery = url_encode(query)
baseUrl = "http://www.sogou.com/web?query=#{equery}&num=5"

if num == "\n"
  num = 10
end
#puts baseUrl
#p num

#query = "exerb"
exp = /.*url="(\/websearch\/snapshot_preview\.jsp\?url=.*)">.*<\/a>.*/
uris = []
equery = url_encode(query)

#p equery
baseUrl = "http://www.sogou.com/web?query=#{equery}&num=#{num}"

begin
  open(baseUrl) do |f|
    f.each_line do |l|
      if l =~ exp
        uris << $1
      end
    end
  end
rescue Exception
  puts $!.class
end

#处理没有被正则表达式正确识别的url
nuri = []
uris.each do |u|
  nuri << u.split('"')[0]
end

=begin
#p nuri.size
out = File.open("o.txt","w") do |f|
  f.puts nuri
end
=end

base = "http://www.sogou.com" 
nuri.each_with_index do |u,i|
  open("#{base}#{u}") do |o|
    data = o.read
    File.open("#{i}.html","w") do |f|
      f.puts data
    end
  end
end

File.open("main.html","w") do |f|
  f.puts '<html>
    <head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
    <title>The search result</title>
    </style>
    </head>
    <frameset cols="150,*">
      <frame src="index.html" name="chute" frameborder="1" scrolling="auto"/>
      <frame src="about:blank" name="arena" frameborder="1" scrolling="auto"/>
    </frameset>
    </html>'
end


File.open("index.html","w") do |f|
  nuri.each_with_index do |u,i|
    f.puts '<html>
      <head>
      <base target="arena">
      </head>
      <body>
      <ul class="zdoc_index_table">
      <li>'
    f.puts "  <div><a href='#{i}.html'>#{i}</a></div>"
    f.puts ' </li>
      </ul>
      </body>
      </html>'
  end
end