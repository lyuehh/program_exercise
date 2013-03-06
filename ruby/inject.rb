r = (0..10).inject([1,0]) { |(a,b),_| 
  puts "a: #{a}, b: #{b}, a+b: #{a+b}, _: #{_}"
  [b, a+b]
}
p r
