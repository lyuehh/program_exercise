def info
  $a = 'Hello'
  puts "方法内部的输出" + $a
end
class Test1
  puts $a#首先执行，结果是nil
end
info#掉用方法，初始化全局变量$a
class Test2
  puts $a#在方法调用之后输出的全局变量
end