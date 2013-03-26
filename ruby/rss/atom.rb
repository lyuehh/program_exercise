require 'atom'

feed = Atom::Feed.load_feed(URI.parse("http://blog.codingnow.com/atom.xml"))
puts feed.entries.length

#p feed.methods
feed.each_entry do |entry|
  # do cool stuff
end
