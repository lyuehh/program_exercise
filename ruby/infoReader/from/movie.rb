require 'rubygems'
require 'hpricot'
require 'open-uri'

module From
	class Movie
		@@num = 0
		attr_accessor :name,:url,:data,:doc,:file,:fileName
		
		def initialize(name,url,fileName)
			@name = name
			@url  = url
			@doc = Hpricot(open(url))
			@file = File.open(fileName,"w")
			@@num += 1
		end
		
		def handleFile(f)
			
		
		end
		
		def getInfo
			#p @doc
			@doc.search("/html/body/div[4]/div/div[1]/ul").each do |f|
				#p @file
				#p "xxx"
				#p f
				@file.puts f
			end
			@file.close
		end
	end
end

