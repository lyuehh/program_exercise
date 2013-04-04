dir = Dir.new("aa")
dir.each do |e|
	f1 = File.new(e,"r+")
	f1.puts 'require "rubygems"'
	f1.close
end
