$A = 'Hello'
class A
  puts $A
end

def b
  puts $A
end
b

def c
  puts $c #�ڷ�������ȫ�ֱ���
end
c  #���÷���c�����Ϊnil����Ϊȫ�ֱ���c��δ��ʼ��
class D
  $c = 'D�ж����ȫ�ֱ���' #�����ж���ȫ�ֱ���
end
c
puts "ֱ�ӷ��� " + $c
