def info
  $a = 'Hello'
  puts "�����ڲ������" + $a
end
class Test1
  puts $a#����ִ�У������nil
end
info#���÷�������ʼ��ȫ�ֱ���$a
class Test2
  puts $a#�ڷ�������֮�������ȫ�ֱ���
end