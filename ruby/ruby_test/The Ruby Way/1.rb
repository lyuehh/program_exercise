#(puts "用法 : ruby #{$0} 'file1' 'file2' ";exit) if ARGV.length != 2
fileIn,fileOut = ARGV
file1,file2,num,page = File.new(fileIn),File.new(fileOut,"w"),0,0
file1.each { |line| 
file2.puts "#{num+=1}: #{line}"; 
if num%22==0;page+=1;file2.puts "时间:#{Time.new},源文件名:#{fileIn},页号:#{page}.";end}
 
  



