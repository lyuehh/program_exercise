class Friend
    @@myname = "Fred"  #һ�������
    def initialize(name, sex, phone)
	@name, @sex, @phone = name, sex, phone
	#��Щ��ʵ������
    end
    def hello # һ��ʵ������
	puts "Hi, I'm #{@name}."
    end
    def Friend.our_common_friend #һ���෽��
	puts "We are all friend of #{@@myname}."
    end

end
f1 = Friend.new("www","F","010-45654854")
f2 = Friend.new("hello","M","012-4568945")
Friend.our_common_friend