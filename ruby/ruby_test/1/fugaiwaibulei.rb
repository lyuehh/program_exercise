class A
  CONST = "A1"
  class B
    puts CONST# ����ⲿ�ೣ��
    CONST = "B1"
    puts CONST #����³���

    puts A:: CONST#��ʽָ��������ⲿ�ೣ��
  end
end