require "open-uri"

data=nil
=begin
open("http://wallpaper.pconline.com.cn/source/257358.html") { |f| 
	f.each_line do |line| 
		if line.include?("http://i") 
			puts line
		end
	end
}
=end
#http://i1.3conline.com/images/piclib/201004/06/batch/1/57324/12704915440221x7ng5865b.jpg
#require 'open-uri'

threads = []


("01".."06").to_a.each do |n|
	threads << Thread.new(n) do |t|  
		t = open "http://www.hongqilu.cc/Photo/UploadPhotos/2010-02-02/3Ddw/#{n}.jpg" do |f|  
			File.open "#{n}.jpg",'wb' do |wf|  
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


#puts data.class

#puts "Retrieved #{data.split.size} lines,#{data.size} bytes"