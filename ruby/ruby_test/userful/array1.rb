#puts here

def random_alphabetic(size=5)
  chars = ('a'..'z').to_a + ('A'..'Z').to_a # ����һ����a��Z��һ����ĸ������
  puts (0...size).collect { chars[rand(chars.length)] }.join
  # ��chars�����з���ָ�����ȵ�����ַ����飨Ĭ��5������
  #����join����������������е�����Ԫ�����ӳ�һ���ַ���
end

random_alphabetic()