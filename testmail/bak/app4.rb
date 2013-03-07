require 'rubygems'
require 'watir'
require 'watir-webdriver'

browser = Watir::Browser.new
browser.goto 'file://localhost/Users/weiwei/work/project/testmail/html/index.html'

browser.text_field({name:'name'}).set 'user101@sohu.com'
browser.text_field({name:'password'}).set '111111'
browser.text_field({name:'intro'}).set "intro\nhahhah"

browser.radio({name:'gender', value: "male"}).set
browser.checkbox({name: 'hobby', value: "movie"}).set
browser.checkbox({name: 'hobby', value: "music"}).set
browser.checkbox({name: 'hobby', value: "book"}).set
browser.checkbox({name: 'hobby', value: "travel"}).set

browser.select_list({name: "from"}).select 'USA'

browser.button({id:'submit'}).click
puts "Title: #{browser.title}"
puts "Browser include text?: #{browser.text.include? 'This'}"

=begin
sleep 2
browser.a(:class : 's_config').click
sleep 1


browser.a(:class : 's_cfg_set').click
sleep 1
browser.radio(:id : 'cfg_httpsfiltersrc', :value : "true").set
browser.radio(:id : 'cfg_autosavesendmail', :value : "true").set


browser.a(:class : 's_cfg_sign').click
sleep 1
browser.checkbox(:id : 'cfg_image_signature', :value : "false").set
=end