require "open-uri"

=begin
open("http://wallpaper.pconline.com.cn/source/257358.html") { |f| 
	f.each_line do |line| 
		if line.include?("http://i") 
			puts line
		end
	end
}
=end

threads = []


(1..10).to_a.each do |n|
	threads << Thread.new(n) do |t|  
		t = open("http://d119.d.iask.com/fs/800/1/3afd906ae0e9b96e71c74432c0207fe120001082/mp3/%E6%88%91%E4%B8%8D%E6%83%B3%E5%BF%98%E8%AE%B0%E4%BD%A0.mp3",
		"Host" =>	"ishare.iask.sina.com.cn",
		"User-Agent" =>	"Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2 QQDownload/1.7",
		"Accept" =>	"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
		"Accept-Language" =>	"zh-cn,zh;q=0.5",
		"Accept-Encoding" =>	"gzip,deflate",
		"Accept-Charset" =>	"GB2312,utf-8;q=0.7,*;q=0.7",
		"Keep-Alive" =>	"115",
		"Connection" =>	"keep-alive",
		"Cookie" =>	"userId=C8C_zrHkjvCI0mCwQhCwJmEyqhCvnjC6niBWTmLiCgDWFn; UOR=,ishare.iask,; SINAGLOBAL=222.82.16.205.170311270707321748; ULV=1270799687271:3:3:3:222.82.16.205.147051270799673447:1270736129521; FocusMediaIpCgiCookie=%u65B0%u7586%7C%7C%u4E4C%u9C81%u6728%u9F50; FocusMediaRotatorInputCookie=6; FocusMediaRotatorCookie=16; vjuids=-451afb1b7.127ddc7ec37.0.7f45674624bde8; vjlast=1270738095; _s_acc=view_PGLS000022; loginType=freemail; PHPSESSID=407ecbaa59777d5061d946a72149a077; Apache=222.82.16.205.147051270799673447; _s_upa=2",
		"Pragma" =>	"no-cache",
		"Cache-Control" =>	"no-cache"
		) do |f|  
			File.open "1.mp3",'wb' do |wf|  
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