class Fruit
  #������A���һ��Foo����
  FOO = "Hello"
  #Bģ������A��һ���ڲ�ģ��
  module Vegetable
    #�ڲ�ģ���ڿ��Է���Foo����
    puts FOO
  end
  #�����ڲ����Է���FOO����
  puts FOO
  #�����ڲ��ķ����ڷ���FOO����
  def info
    puts FOO  
  end
 # info;
  #B������A��һ���ڲ���
  class  Dog
    #�ڲ�����Է���FOO����
    puts FOO
  end
end
#����Apple�̳���Fruit
class Apple < Fruit
  #����D�п��Է�����A�еĳ���
  puts FOO
end

#info;