$A = 'Hello'
class A
  puts $A
end

def b
  puts $A
end
b

def c
  puts $c #在方法调用全局变量
end
c  #调用方法c，结果为nil，因为全局变量c还未初始化
class D
  $c = 'D中定义的全局变量' #在类中定义全局变量
end
c
puts "直接访问 " + $c
