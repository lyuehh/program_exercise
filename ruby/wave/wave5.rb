x = 0
loop do
  dot = '-' * ((1+Math.sin(x += 0.15)) * 15) *2
  puts dot.center 60
  sleep 0.01
end
