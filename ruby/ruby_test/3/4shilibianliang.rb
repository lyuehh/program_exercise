module Vegetable
  attr :color,true#��ģ����ʹ��attr����һ��@colorʵ������
end
class Apple
  include Vegetable#����Vegetable��ʵ������
end
a = Apple.new
a.color = "��ɫ"
puts a.color

class Apple
  @color = 'red'
  def info
    puts @color
  end
  puts '�෶Χ�ڵ�ʵ������' + @color
end
a = Apple.new
a.info

class Apple2
  @color = 'blue'#����һ���෶Χ�ڵ�ʵ������@color����ʵ����������class���ʵ��
  def color=(value)
    @color = value#��������Apple2ʵ����ʵ������
  end
  def Apple2.color#����һ���෽����
    @color#�෽���ĵ�������Apple2����Ҳ����class���ʵ��
          #��ˣ��˴����ʵ����෶Χ��ʵ������
  end
end
puts Apple2.color