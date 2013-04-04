# puts your code here
# puts your code here
num = File.read("dat.dat")
c = num.to_i
sh = File.new("sh.dat","w")
sh.puts c
sh.close