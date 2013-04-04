require "rubygems"
require "oauth"
require "hpricot"
require "open-uri"
require "erubis"

module From

	class SinaEntity
		attr_accessor :created_at,:text,:original_pic,:name
	end
	class Sina
		attr_accessor :name,:url,:data,:doc,:file,:fileName,:entities,:ret,:access_token
		@@num = 0
		def initialize(name)
			@name = name
			#@url  = url
			#@doc = Hpricot(open(url))
			#@file = File.open(fileName,"w")
			@@num += 1
		end
		
		def login
			sina_api_key = "635628042"
			sina_api_secret = "4ab48f747b5bed95dccc56307a18df10"
			
			consumer = OAuth::Consumer.new(
				sina_api_key,
				sina_api_secret,
				:site => "http://api.t.sina.com.cn"
			)
			
			#1. get request_token
			request_token = consumer.get_request_token
			
			#2. authorize & get oauth_verifier
			puts "copy this url to your browser to authorize,and get the oauth verifier code:"
			puts request_token.authorize_url
			
			code = gets.chomp!
			#@oauth_verifier = "628441" #puts the verifier code here
			puts "[#{code}]"
			oauth_verifier = code
			#3. get access_token
			@access_token = request_token.get_access_token(:oauth_verifier => oauth_verifier)
			@access_token
			
			#4.API Example
			#@ret = access_token.get "/statuses/friends_timeline.xml"
			#@ret
		end
		
		def getEntities
			login
			@doc = Hpricot(@access_token.get("/statuses/friends_timeline.xml").to_s)
			@entities = []
			@doc.search("/statuses/status") do |d|
				e = SinaEntity.new
				e.created_at = d.search("/created_at").inner_html
				e.text = d.search("/text").inner_text
				e.name = d.search("/user/name").inner_html
				e.original_pic = d.search("/original_pic").inner_html
				@entities.insert(-1,e)
			end
			@entities
		end
		
		def getInfo
			getEntities
			input = File.read("sc.html")
			eruby = Erubis::Eruby.new(input)
			@entities.each_with_index do |s,i|
				#puts eruby.evaluate(s)
				
				File.open("html/s_#{i}.html","w") do |f|
					f.puts eruby.evaluate(s)
				end
			end
		end
	end
	
end
From::Sina.new("新浪微博").getInfo