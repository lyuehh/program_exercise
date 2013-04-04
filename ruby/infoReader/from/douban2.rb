require "rubygems"
require "hpricot"
require "open-uri"
require "erubis"

module From
	class Entity
		attr_accessor :title,:link,:name,:published,:content
	end
	class Douban
		@@num = 0
		attr_accessor :name,:url,,:doc,:file,:fileName,:entities
		
		def initialize(name,url)
			@name = name
			@url  = url
			@doc = Hpricot(open(url))
			#@file = File.open(fileName,"w")
			@@num += 1
		end
		
		def getEntities
			@entities = []
			
			#p @doc
			#p "-----"
			
			@doc.search("/feed/entry") do |d|
				e = Entity.new
				#p d
				#p "!!!"
				e.title = d.search("/title").inner_html
				e.published = d.search("/published").inner_html
				e.content = d.search("/content").inner_text
				e.name = d.search("/author/name").inner_html
				e.link = d.search("/author/link")[1].get_attribute("href")
				
				@entities.insert(-1,e)
				
			end
			
			@entities
		end
		
		def getInfo
			#@file.puts @doc
			#@file.close
			getEntities
			#p @entities
			#@file.puts @entities
			#@file.close
			
			input = File.read("from/tc.html")
			eruby = Erubis::Eruby.new(input)
			@entities.each_with_index do |s,i|
				#puts eruby.evaluate(s)
				break if i > 10
				File.open("html/t_#{i}.html","w") do |f|
					f.puts eruby.evaluate(s)
				end
			end
		end
	end
end

