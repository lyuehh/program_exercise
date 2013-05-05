x = 0
y = 0
loop do
  puts '-' * ((1 + Math.sin(x += 0.018)) * ((1 + Math.sin(y += 0.15))) * 20)
  sleep 0.01
end
