my_array = [1,2,3,4,5,6]
my_array.each do |x|
  print x
  if x%2 == 0
    puts " is even."
  else 
    puts " is odd. "
  end
end