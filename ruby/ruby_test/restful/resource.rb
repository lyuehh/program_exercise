#require 'activesupport-2.3.2/lib/active_support'
#require 'activeresource-2.3.2/lib/active_resource'
require "rubygems"
require "activeresource"
require "activesupport"
class Message < ActiveResource::Base
  self.site = 'http://localhost:3000/'
end


#f2 = File.new("a.xml","w")
def show_messages
  messages = Message.find :all
  #puts "I see #{messages.size} messages."
  messages.each do |m|
    #puts "Title: #{m.title}"
    #puts "Content: #{m.content}"
    puts  "#{m.to_xml}"
  end
end

#show_messages

f1 = Message.find(16)
puts "#{f1.to_xml}"
#new_message = Message.new(:title => "test",:content => "This is a test content2.")
#new_message.save


#new_message.content = "After update2."
#new_message.save



#new_message.destroy

#puts
#show_messages
