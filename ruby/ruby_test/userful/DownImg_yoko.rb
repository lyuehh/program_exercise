require "open-uri"

data=nil

uris = []
reg = /.*(\/admin.*.jpg)/
#http://i7.game.itc.cn/2010/game/2010/04/16/cr0416zhan01s.jpg
#http://game.sohu.com/content/2010-04-16/20100416170944204,1.shtml
#http://life.xj169.com/Article/ShowArticle.aspx?ArticleID=72774&Page=18
(1..21).each do |u|
  begin 
   open("http://life.xj169.com/Article/ShowArticle.aspx?ArticleID=72774&Page=#{u}") do |f|
		f.each_line do |line| 
			if line =~ reg
				uris << $1
				puts $1
			end
		end
	end
	rescue Exception
	puts $!.class
  # else
  # ensure
  end
 
end



=begin
uf = File.open("uri_files.txt","w") do |f|
  f.puts uris
end
puts uris
=end


#http://i1.3conline.com/images/piclib/201004/06/batch/1/57324/12704915440221x7ng5865b.jpg
#require 'open-uri'

threads = []
#uris << "http://i5.3conline.com/images/piclib/201004/06/batch/1/57324/1270491544022olt3l1lbt0.jpg"

uris.each do |n|

	threads << Thread.new(n) do |t|  
		t = open("http://life.xj169.com#{n}") do |f| 
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