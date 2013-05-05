x = 0
loop do
  space = ' ' * (30-((1+Math.sin(x+=0.15))*15))
  dot = '-' * ((1+Math.sin(x)) * 15) *2
  puts space + dot
  sleep 0.01
end
