require "open-uri"

data=nil

uris = []
reg = /.*(http:\/\/i.*.jpg)/
#http://file2.u148.net/images/2010/10/time/2.jpg  1-21

1.upto(21) do |n|
	threads << Thread.new(n) do |t|  
		t = open("http://file2.u148.net/images/2010/10/time/#{n}.jpg") do |f| 
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
