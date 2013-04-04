class Apple 
  @@color = 'red'
  puts @@color
  def info
    puts '苹果的颜色是' + @@color
  end
end
Apple.new.info

class Apple2
  def color2=(att)
    @@color2 = att#定义类变量
  end
  def color2
    @@color2#访问类变量
  end
  puts defined?@@color2#此时的类变量还没初始化
end
#创建2个类实例
a1 = Apple2.new
a2 = Apple2.new
a1.color2 = '红色'#一次给类变量赋值
a2.color2 = '绿色'
puts a1.color2#调用a1的方法访问类变量