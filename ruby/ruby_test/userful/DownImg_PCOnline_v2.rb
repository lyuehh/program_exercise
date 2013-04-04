require "open-uri"

uris = []
reg = /.*(http:\/\/i.*.jpg)/
threads = []

#http://wallpaper.pconline.com.cn/source/253302.html
#http://wallpaper.pconline.com.cn/source/255912.html
(255910..255920).each do |u|
  threads << Thread.new(u) do |t|
    begin
      open("http://wallpaper.pconline.com.cn/source/#{u}.html") do |f|
				f.each_line do |line|
					if line =~ reg
						#uris << $1
						t = open("#{$1}",
							"User-Agent" => 	"Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2 QQDownload/1.7",
							"Accept" =>	 "image/png,image/*;q=0.8,*/*;q=0.5",
							"Accept-Language" => 	"zh-cn,zh;q=0.5",
							"Accept-Encoding" =>	"gzip,deflate",
							"Accept-Charset" =>  "GB2312,utf-8;q=0.7,*;q=0.7",
							"Keep-Alive" =>	"115",
							"Connection" =>	 "keep-alive",
							"Referer"	=> "http://wallpaper.pconline.com.cn/source/257333.html",
							"Pragma" =>	 "no-cache",
							"Cache-Control"	=> "no-cache"
						) do |f|
						  a = $1.split('/')[-1]
							File.open "#{a}.jpg",'wb' do |wf|
								wf << f.read
								puts n
								puts Thread.list
							end
						end
					end
				end
			end
		rescue Exception
			puts $!.class
      # else
      # ensure
		end
  end
  threads.each do  |a|
    a.join
  end
end




=begin
uris.each do |n|
	threads << Thread.new(n) do |t|
		t = open("#{n}",
      "User-Agent" => 	"Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2 QQDownload/1.7",
      "Accept" =>	 "image/png,image/*;q=0.8,*/*;q=0.5",
      "Accept-Language" => 	"zh-cn,zh;q=0.5",
      "Accept-Encoding" =>	"gzip,deflate",
      "Accept-Charset" =>  "GB2312,utf-8;q=0.7,*;q=0.7",
      "Keep-Alive" =>	"115",
      "Connection" =>	 "keep-alive",
      "Referer"	=> "http://wallpaper.pconline.com.cn/source/257333.html",
      "Pragma" =>	 "no-cache",
      "Cache-Control"	=> "no-cache"
    ) do |f|
			a = n.split('/')[-1]
			File.open "#{a}.jpg",'wb' do |wf|
				wf << f.read
				puts n
				puts Thread.list
			end
		end
	end
end
threads.each {|a|
	a.join
}
=end

=begin
uf = File.open("uri_files.txt","w") do |f|
  f.puts uris
end
puts uris
=end


#http://i1.3conline.com/images/piclib/201004/06/batch/1/57324/12704915440221x7ng5865b.jpg
#require 'open-uri'


#uris << "http://i5.3conline.com/images/piclib/201004/06/batch/1/57324/1270491544022olt3l1lbt0.jpg"



=begin
"Connection" => "	keep-alive",
	"Referer" => "ww.222.com",
	"Cache-Control" => "no-cache"
end
=begin
t = open("http://i1.3conline.com/images/piclib/201004/06/batch/1/57324/12704915440221x7ng5865b.jpg",
	"User-Agent" => "	Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2",
	"Connection" => "	keep-alive",
	"Referer" => "www.xxx.com",
	"Cache-Control" => "no-cache") do |f|
	File.open "1.jpg",'wb' do |wf|
		wf << f.read
	end
end
=end

#puts data.class

#puts "Retrieved #{data.split.size} lines,#{data.size} bytes"