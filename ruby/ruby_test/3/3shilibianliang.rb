class Apple
  #使用attr创建了一个@name的实例变量，且为该变量创建了读取方法
  attr :name
  #使用attr创建了一个@color实例变量，且为该变量创建了读取和设置方法
  attr :color ,true
  #使用attr_reader创建了一个@weight实例变量，创建了读取方法
  attr_reader :weight
  #使用attr_writer创建了一个@size实例变量，创建了设置方法
  attr_writer :size
  #使用attr_accessor创建了一个@info实例变量，创建了读取和设置方法
  attr_accessor :info
end
a = Apple.new
puts a.name#@name属性只可访问
a.color = "red"#color属性可设置，也可以访问
puts a.color
puts a.weight#weight属性只可访问
a.size = 0.2#size属性只可设置
a.info = "可口的水果"#info属性可设置也可访问
puts a.info