file = File.new("44_2_5.dat","w")
file.puts "Once upon\na time\nThe End"
file.read("44_2_5.dat")
str = file.each do |line|
  num +=1
  print "Line #{num}: #{line}"
end