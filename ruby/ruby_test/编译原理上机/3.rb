(puts "用法 : ruby #{$0} 'file1' 'file2' ";exit) if ARGV.length != 2
fileIn,fileOut = ARGV
file2 = File.new(fileOut,"w")
file1 = IO.read(fileIn)

lineNum = 1
file1.each do |line|
  #puts line if lineNum == 2
  line.replace("") if line.index("//")
  line.replace("")  if line.include? "*/"
  line.replace("")  if line.include? "/*"
  line.chop!
  file2.print line
end