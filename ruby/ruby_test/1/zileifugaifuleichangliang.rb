class A
  CONST = 'A1'#���常�ೣ��
end
class B < A#B��̳�A��
  puts CONST#������ೣ��
  CONST = 'B1'#�������ೣ�������Ǹ��ೣ��
  puts CONST#������ೣ��
  puts A::CONST#��ʽ������ೣ��
end 