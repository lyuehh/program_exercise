class Apple
  #ʹ��attr������һ��@name��ʵ����������Ϊ�ñ��������˶�ȡ����
  attr :name
  #ʹ��attr������һ��@colorʵ����������Ϊ�ñ��������˶�ȡ�����÷���
  attr :color ,true
  #ʹ��attr_reader������һ��@weightʵ�������������˶�ȡ����
  attr_reader :weight
  #ʹ��attr_writer������һ��@sizeʵ�����������������÷���
  attr_writer :size
  #ʹ��attr_accessor������һ��@infoʵ�������������˶�ȡ�����÷���
  attr_accessor :info
end
a = Apple.new
puts a.name#@name����ֻ�ɷ���
a.color = "red"#color���Կ����ã�Ҳ���Է���
puts a.color
puts a.weight#weight����ֻ�ɷ���
a.size = 0.2#size����ֻ������
a.info = "�ɿڵ�ˮ��"#info���Կ�����Ҳ�ɷ���
puts a.info