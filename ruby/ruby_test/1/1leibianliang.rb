class Apple 
  @@color = 'red'
  puts @@color
  def info
    puts 'ƻ������ɫ��' + @@color
  end
end
Apple.new.info

class Apple2
  def color2=(att)
    @@color2 = att#���������
  end
  def color2
    @@color2#���������
  end
  puts defined?@@color2#��ʱ���������û��ʼ��
end
#����2����ʵ��
a1 = Apple2.new
a2 = Apple2.new
a1.color2 = '��ɫ'#һ�θ��������ֵ
a2.color2 = '��ɫ'
puts a1.color2#����a1�ķ������������