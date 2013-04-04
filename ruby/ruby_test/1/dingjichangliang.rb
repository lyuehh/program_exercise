class Fruit #定义一个Fruit类
  
  CONST = 'FOO'#定义一个变量
end
CONST = 'ABC'#定义一个顶级常量

class Apple < Fruit
  
  puts CONST#输出FOO

  puts :: CONST#显式输出ABC
end