class Friend
    @@myname = "Fred"  #一个类变量
    def initialize(name, sex, phone)
	@name, @sex, @phone = name, sex, phone
	#这些是实例变量
    end
    def hello # 一个实例方法
	puts "Hi, I'm #{@name}."
    end
    def Friend.our_common_friend #一个类方法
	puts "We are all friend of #{@@myname}."
    end

end
f1 = Friend.new("www","F","010-45654854")
f2 = Friend.new("hello","M","012-4568945")
Friend.our_common_friend