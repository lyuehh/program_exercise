# encoding: utf-8

require 'rubygems'
require 'watir'
require 'watir-webdriver'

t1 = Time.now
browser = Watir::Browser.new :firefox, :profile => 'default'
def browser.search
  goto('http://news.mtime.com/pix/2013/05/31/378246.html')
  sleep 2

  button({class:'next'}).click
end

browser.search

t2 = Time.now
puts "finished in #{t2 - t1} seconds.."
