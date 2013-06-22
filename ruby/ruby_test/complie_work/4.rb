(puts "用法 : ruby #{$0} 'file1' 'file2' ";exit) if ARGV.length != 2
fileIn,fileOut = ARGV
file2 = File.new(fileOut,"w")
words = String.new
baoliuziA = ['def','puts','end']
yunsuanfuA = ['+','-','*','/']
biaozhifu = Array.new
baoliuzi = Array.new
shishu = Array.new
changliang = Array.new
yunsuanfu = Array.new

arr = IO.read(fileIn)
words = arr.split
num = 0
words.each do |word|
  num += 1
  if word =~ /[0-9]/
    file2.puts "#{num}.实数: #{word}"
    #shishu << word
  elsif word =~ /\+|\-|\*|\/|\=/
  file2.puts "#{num}.运算符: #{word}"
    #yunsuanfu << word
  elsif word =~ /[A-Z]/
  file2.puts "#{num}.常量: #{word}"
    #changliang << word
   elsif baoliuziA.include?(word)
    file2.puts "#{num}.保留字: #{word}"
  elsif  word =~ /[a-z]/
  file2.puts "#{num}.标识符: #{word}" 
    #biaozhifu << word
  elsif baoliuziA.include?(word)
    file2.puts "#{num}.保留字: #{word}"
  end
end

#file2.puts "保留字是:" + baoliuziA.join(', ')
#file2.puts "标识符是:" + "#{(biaozhifu - baoliuziA).uniq.join(", ")}"
#file2.puts "实数:" + shishu.join(', ')
#file2.puts "常量是:" + changliang.join(', ')
#file2.puts "运算符是:" + yunsuanfu.uniq.join(', ')



