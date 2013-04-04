class Apple
  def initialize(name)#构造器
    @name=name#执行构造器时添加一个实例方法
  end
  def name#定义一个与name实例变量同名的方法，该方法返回实例变量@name
    return @name
  end
  def name=(att)#定义一个名为name=的方法，该方法用于为@name实例变量赋值
    @name=att
  end
end
a = Apple.new("红富士")#创建Apple实例
puts a.name#通过name方法来访问@name实例变量

a.name="青苹果"#调用name=方法来为@name实例变量设置值
puts a.name

b = Apple.new("苹果")
#puts b.name
b.name = '苹果2'

puts b.name