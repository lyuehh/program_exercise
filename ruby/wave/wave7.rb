Thread.new do
  system "say -r 300 #{'swa ' * 15}"
end

require "tempfile"
path = Tempfile.open 'nyan.mp3' do |f|
  F = f # just don't GC it
  f << `curl -s http://cdn.nyanit.com/audio/nyanlooped.mp3`
  f.path
end
Thread.new{loop{system "afplay #{path}"}}

dot = ->{
  i = 0
  j = 16
  -> {
    i += 1
    if i % 100 == 0
      i = 0
      j += 1
    end
    if j > 231
      j = 16
    end
    "\e[38;5;#{j}m█"
  }
}[]

x = 0
y = 0
loop do
  print ' ' * ((1 + Math.sin(x += 0.1)) * 15 + 10)
  n = ((1 + Math.sin(y += 0.019)) * 10).ceil
  puts(n.times.map{dot[]}.join)
  sleep 0.01
end
