#puts here

def random_alphabetic(size=5)
  chars = ('a'..'z').to_a + ('A'..'Z').to_a # 构建一个从a到Z的一个字母表数组
  puts (0...size).collect { chars[rand(chars.length)] }.join
  # 从chars数组中返回指定长度的随机字符数组（默认5个），
  #调用join方法，将这个数组中的所有元素连接成一个字符串
end

random_alphabetic()