s1 = "It was a dark and story night."
words = s1.split
puts words

s2 = "apples,pears,and peaches"
puts list = s2.split(", ")

s3 = "lions and tigers and bears"
puts zoo = s3.split(/ and /)

s3 = "Hello World."
puts s3_1 = s3.downcase#小写
puts s3_2 = s3.upcase#大写

s4 = "hello World."
puts s4_1 = s4.capitalize#首字母大些，其余小写

s5 = "THIS IS AN ex-parrot."
puts s5_1 = s5.swapcase# 改变每一个字母的大小写

etc = "Etc. "*3
puts etc
puts ruler = "+" + ("."*4+"5"+"."*4+"+")*3#重复
=begin
coded = "hfCghHIE5LAM."
puts "Speak,friend,end enter!"
print "Password:"
password = gets.chop
if password.crypt("hf") == coded
  puts "Welcome!"
else 
  puts "What are you,an orc?"
end
=end

s6 = "Star Trek"
puts s6_1 = s6.reverse#反转字符串

phrase = "Now here's a sentence"
puts phrase.split(" ").reverse.join(" ")#反转单词

s7 = "bookkeeper"
puts s7_1 = s7.squeeze#删除重复字符

s8 = "To be,or not to be"
puts s8_1 = s8.delete("b")#删除指定的字符
s9 = "Veni, vidi, vici!"
puts s9_1 = s9.delete(",!")

droid = "R2D2"
puts droid_1 = droid.succ#生成后续字符串
a = "ASD@#EFDF#3"
puts a_1 = a.succ


#puts crc = crc32("Hello")