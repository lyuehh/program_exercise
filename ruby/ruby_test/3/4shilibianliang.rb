module Vegetable
  attr :color,true#在模块里使用attr定义一个@color实例变量
end
class Apple
  include Vegetable#混入Vegetable的实例变量
end
a = Apple.new
a.color = "红色"
puts a.color

class Apple
  @color = 'red'
  def info
    puts @color
  end
  puts '类范围内的实例变量' + @color
end
a = Apple.new
a.info

class Apple2
  @color = 'blue'#定义一个类范围内的实例变量@color，该实例变量属于class类的实例
  def color=(value)
    @color = value#定义属于Apple2实例的实例变量
  end
  def Apple2.color#定义一个类方法是
    @color#类方法的调用者是Apple2本身，也就是class类的实例
          #因此，此处访问的是类范围的实例变量
  end
end
puts Apple2.color