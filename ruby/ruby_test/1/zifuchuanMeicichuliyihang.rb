str = "Once upon\na time..\nThe end"
num =0
str.each do |line|
  num += 1
  print "Line #{num}: #{line}"
end