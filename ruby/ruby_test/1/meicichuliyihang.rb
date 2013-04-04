str = "Once upon\na time\nThe end"
num = 0
str.each do |a|
  num += 1
  print "Line #{num};#{a}"
end