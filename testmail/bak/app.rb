require 'rubygems'
require 'watir'
require 'watir-webdriver'

#require '/Users/weiwei/work/project/testmail/a'
require './steps'

date1 = Time.new

class App
	include Steps
	include Rake::DSL
	attr_accessor :browser
	
	def initialize
		@browser = Watir::Browser.new
	end
end

app = App.new
app.run('file://localhost/Users/weiwei/work/project/testmail/html/index.html')
p app.methods

p app.methods.select { |i| p i.index('step_') == 0}

date2 = Time.new
puts "Time: #{date2-date1} seconds"