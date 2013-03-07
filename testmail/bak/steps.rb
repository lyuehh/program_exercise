require 'rake'

module Steps
	include Rake::DSL

	def run(url)
		self.browser.goto url
		Rake::Task['all'].invoke
	end

	task :text do
		self.browser.text_field({name:'name'}).set 'user101@sohu.com'
		self.browser.text_field({name:'password'}).set '111111'
		self.browser.text_field({name:'intro'}).set "intro\nhahhah"
	end

	task :check => :text do
		browser.radio({name:'gender', value: "male"}).set
		browser.checkbox({name: 'hobby', value: "movie"}).set
		browser.checkbox({name: 'hobby', value: "music"}).set
		browser.checkbox({name: 'hobby', value: "book"}).set
		browser.checkbox({name: 'hobby', value: "travel"}).set
	end

	task :all => :check do
		browser.button({id:'submit'}).click
		puts "Title: #{browser.title}"
		puts "Browser include text?: #{browser.text.include? 'This'}"
	end
end

=begin
date1 = Time.new
url = 'file://localhost/Users/weiwei/work/project/testmail/html/index.html'
browser = Watir::Browser.new

task :open do
	browser.goto url
end

task :text => :open do
	browser.text_field({name:'name'}).set 'user101@sohu.com'
	browser.text_field({name:'password'}).set '111111'
	browser.text_field({name:'intro'}).set "intro\nhahhah"
end

task :check => :text do
	browser.radio({name:'gender', value: "male"}).set
	browser.checkbox({name: 'hobby', value: "movie"}).set
	browser.checkbox({name: 'hobby', value: "music"}).set
	browser.checkbox({name: 'hobby', value: "book"}).set
	browser.checkbox({name: 'hobby', value: "travel"}).set
end

task :select => :check do
	browser.select_list({name: "from"}).select 'USA'
end

=end