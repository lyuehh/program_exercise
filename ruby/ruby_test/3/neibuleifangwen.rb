#定义一个Fruit类
class Fruit
  CONST = 'FOO'
end
class Dog
  CONST = 'Bar'
  #定义一个内部类：Apple，让Apple继承Fruit
  class Apple #< Fruit
  #优先输出外部类的变量
  puts CONST
  #显式指定输出父类的常量
  puts Fruit::CONST
  end
end