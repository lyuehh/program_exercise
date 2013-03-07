require 'rubygems'
require 'watir'
require 'watir-webdriver'

browser = Watir::Browser.new

def browser.text
  goto('file://localhost/Users/weiwei/work/project/testmail/index.html')
  text_field({name:'name'}).set 'user101@sohu.com'
  text_field({name:'password'}).set '111111'
  text_field({name:'intro'}).set "intro\nhahhah"
end

def browser.check
  browser.text
  radio({name:'gender', value: "male"}).set
	checkbox({name: 'hobby', value: "movie"}).set
	checkbox({name: 'hobby', value: "music"}).set
	checkbox({name: 'hobby', value: "book"}).set
	checkbox({name: 'hobby', value: "travel"}).set
  select_list({name: "from"}).select 'USA'
end

def browser.other
  button({id:'submit'}).when_present.click
  #contains_text("Content in page")
  puts browser.text
  puts text.include?('Content in page')
  #form(:index, 2).submit  #提交from
  #frame("menu").link(:text, "Books").click # frame 操作
  puts text_field(:name, "name").value.include?('user101@sohu.com')
  puts true if h2({id:'aaa'}).text =~ /^Content/
  puts a({href:'http://www.google.com/'}).exists?
end

def browser.all
  browser.check
  browser.other
end

browser.all
