(puts "用法 : ruby #{$0} 'file1' 'file2' ";exit) if ARGV.length != 2
fileIn,fileOut = ARGV
file2 = File.new(fileOut,"w")
num,wordNum = 0,0
arr = IO.read(fileIn)
words = arr.split
words.each do |word|
  if  word =~ /[1-9]/
    num += 1
    file2.puts "数字:" + word
  elsif word =~ /[a-z]/
    wordNum += 1
    file2.puts "单词:" + word
  elsif word = '.'
    file2.puts "句点：" + '.'
  end
end

file2.puts "数字共" + num.to_s + "个"
file2.puts "单词共" + wordNum.to_s + "个"
file2.puts "最后一个为句点"


