#在这一下输入你的代码
def more_yielding
  puts "The code block shall multiply a number by 10."
  result = yield(3)
  puts "The result of this operation is #{result}."
end

more_yielding {|x| x*10}