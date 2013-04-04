class Apple
  def info1#定义一个方法
    puts @a#输出实例变量a
  end

  def info2#定义方法2
    @a = 'Hello'#初始化实例变量a
  end
end

apple = Apple.new#创建Apple类实例
apple.info2#调用方法
apple.info1