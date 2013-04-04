begin 
	x = 1/0
rescue Exception
  x = 0
	puts($!.class)
	puts($!)
# else
# ensure
end