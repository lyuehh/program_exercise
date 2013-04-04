class A
  CONST = "A1"
  class B
    puts CONST# 输出外部类常量
    CONST = "B1"
    puts CONST #输出新常量

    puts A:: CONST#显式指定输出的外部类常量
  end
end