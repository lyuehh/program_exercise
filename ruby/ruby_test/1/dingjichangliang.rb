class Fruit #����һ��Fruit��
  
  CONST = 'FOO'#����һ������
end
CONST = 'ABC'#����һ����������

class Apple < Fruit
  
  puts CONST#���FOO

  puts :: CONST#��ʽ���ABC
end