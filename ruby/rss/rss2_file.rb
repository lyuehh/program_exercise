require 'feedzirra'

feed = Feedzirra::Feed.fetch_and_parse("http://coolshell.cn/feed")
p feed.methods

puts feed.entries.length
