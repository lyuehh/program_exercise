class Apple
  def info1#����һ������
    puts @a#���ʵ������a
  end

  def info2#���巽��2
    @a = 'Hello'#��ʼ��ʵ������a
  end
end

apple = Apple.new#����Apple��ʵ��
apple.info2#���÷���
apple.info1