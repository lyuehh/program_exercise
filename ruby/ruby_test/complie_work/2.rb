(puts "�÷� : ruby #{$0} 'file1' 'file2' ";exit) if ARGV.length != 2
fileIn,fileOut = ARGV
file2 = File.new(fileOut,"w")
num,wordNum = 0,0
arr = IO.read(fileIn)
words = arr.split
words.each do |word|
  if  word =~ /[1-9]/
    num += 1
    puts "����:" + word
  elsif word =~ /[a-z]/
    wordNum += 1
    puts "����:" + word
  elsif word = '.'
    puts "��㣺" + '.'
  end
end

puts "���ֹ�" + num.to_s + "��"
puts "���ʹ�" + wordNum.to_s + "��"
puts "���һ��Ϊ���"

