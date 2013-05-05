Wave = []
loop do
  20.times do
      Wave.unshift(1)
      p Wave
      sleep(0.01)
  end
  20.times do
      Wave.pop
      p Wave
      sleep(0.01)
  end
end
