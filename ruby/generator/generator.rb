require "rubygems"
require "erubis"
require "hpricot"
#require "open-uri"

class Field
	attr_accessor :name,:ename,:size
end

class Service
	attr_accessor :name,:description,:input_count,:output_count,:multi,:req_fields,:rsp_fields
end

class Dataa
	attr_accessor :size,:doc,:services
	def initialize(p1)
		@doc = Hpricot(open(p1))
		@size = @doc.search("/h2service/service").size
	end
	def get_services
		@services = []
		@doc.search("/h2service/service").each do |s|
		
			service = Service.new
			service.name = 	s.get_attribute("name")
			service.description = s.get_attribute("description")
			
			req_fields = []
			rsp_fields = []
			
			s.search("/request") do |r|
				(r/:field).each do |f|
					req_field = Field.new
					req_field.name = f.get_attribute("name")
					req_field.ename = f.get_attribute("ename")
					req_field.size = f.get_attribute("size")
					req_fields.insert(-1,req_field)
				end
			end
			
			s.search("/response") do |r|
				service.multi = r.get_attribute("multirecord")
				
				(r/:field).each do |f|
					rsp_field = Field.new
					rsp_field.name = f.get_attribute("name")
					rsp_field.ename = f.get_attribute("ename")
					rsp_field.size = f.get_attribute("size")
					rsp_fields.insert(-1,rsp_field)
				end
			end
			service.req_fields = req_fields
			service.rsp_fields = rsp_fields
			service.input_count = service.req_fields.size
			service.output_count = service.rsp_fields.size
			@services.insert(-1,service)
			
			#pp req_fields.size
			#pp rsp_fields.size
			#p @services
			#p "----#{@services.size}"
		end
		@services
	end
end

class Application
	attr_accessor :data,:services
	def initialize(file)
		@data = Dataa.new(file)
		@services = @data.get_services
	end
	
	def start
		
		input = File.read("template.ec")
		eruby = Erubis::Eruby.new(input)
		@services.each do |s|
			#puts eruby.evaluate(s)
			File.open("data_#{s.name}.c","w") do |f|
				f.puts eruby.evaluate(s)
			end
		end
	end
	
end

Application.new("conf.xml").start