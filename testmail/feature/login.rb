require 'rubygems'
require 'watir'
require 'watir-webdriver'

browser = Watir::Browser.new :firefox, :profile => 'default'

def browser.login
  goto('http://mail.sohu.com')
  sleep 5
  text_field({name:'password'}).set '111111'
  text_field({name:'username'}).set 'user101'
  button({id:'login_img'}).click
end

def browser.writemail
  browser.login

  sleep 2
  div({class:'s_writemail'}).click
  sleep 2
  text_field({id:'compose.wto_f'}).set 'user101@sohu.com'
  text_field({id:'compose.subject'}).set 'test with waitr...'
  button({class:'s_send_mail'}).click
end

def browser.all
  browser.writemail
end

begin
  browser.all
rescue Watir::Exception::UnknownObjectException => e
  p e
  puts 'the element is not there'
end
