#在这一下输入你的代码
def yield_an_arg
  puts "Yielding 10!"
  yield(10)
end

yield_an_arg {|x| puts "> Code block received this argument: #{x}" }