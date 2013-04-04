class A
  CONST = 'A1'#定义父类常量
end
class B < A#B类继承A类
  puts CONST#输出父类常量
  CONST = 'B1'#定义子类常量，覆盖父类常量
  puts CONST#输出子类常量
  puts A::CONST#显式输出父类常量
end 