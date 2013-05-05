x = 0
loop do
  puts '-' * ((1 + Math.sin(x += 0.1)) * 20)
  sleep 0.01
end
