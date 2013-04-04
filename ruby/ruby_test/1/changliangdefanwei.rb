class Fruit
  #定义类A里的一个Foo常量
  FOO = "Hello"
  #B模块是类A的一个内部模块
  module Vegetable
    #内部模块内可以访问Foo常量
    puts FOO
  end
  #在类内部可以访问FOO常量
  puts FOO
  #在类内部的访问内访问FOO常量
  def info
    puts FOO  
  end
 # info;
  #B类是类A的一个内部类
  class  Dog
    #内部类可以访问FOO常量
    puts FOO
  end
end
#让类Apple继承类Fruit
class Apple < Fruit
  #在类D中可以访问类A中的常量
  puts FOO
end

#info;