(puts "�÷� : ruby #{$0} 'file1' 'file2' ";exit) if ARGV.length != 2

fileIn,fileOut = ARGV

file1 = File.new(fileIn)
file2 = File.new(fileOut,"w")
num,page = 0,0
file1.each do |line|
  num += 1
  file2.puts "#{num}: #{line}"

  if num % 22 ==0
    page += 1 
    file2.puts "/******************************************************/"
    file2.puts "/*  ʱ��:#{Time.new}                                  */"
    file2.puts "/*  Դ�ļ���:#{fileIn}                            */"
    file2.puts "/*  ҳ��:#{page}                                      */"
    file2.puts "/******************************************************/"
  end
end
file1.close

