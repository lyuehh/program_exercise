#����һ��Fruit��
class Fruit
  CONST = 'FOO'
end
class Dog
  CONST = 'Bar'
  #����һ���ڲ��ࣺApple����Apple�̳�Fruit
  class Apple #< Fruit
  #��������ⲿ��ı���
  puts CONST
  #��ʽָ���������ĳ���
  puts Fruit::CONST
  end
end