class Apple
  def initialize(name)#������
    @name=name#ִ�й�����ʱ���һ��ʵ������
  end
  def name#����һ����nameʵ������ͬ���ķ������÷�������ʵ������@name
    return @name
  end
  def name=(att)#����һ����Ϊname=�ķ������÷�������Ϊ@nameʵ��������ֵ
    @name=att
  end
end
a = Apple.new("�츻ʿ")#����Appleʵ��
puts a.name#ͨ��name����������@nameʵ������

a.name="��ƻ��"#����name=������Ϊ@nameʵ����������ֵ
puts a.name

b = Apple.new("ƻ��")
#puts b.name
b.name = 'ƻ��2'

puts b.name