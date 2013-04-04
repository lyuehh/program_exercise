# puts your code here
class Friend
  @@myname = "Fred"
  def initialize(name,sex,phone)
    @name,@sex,@phone = name,sex,phone
  end
  def hello
    print "Hi,I'm #{@name},"
    case @sex
      when "F" 
        print "and I'm man,"
      when "M" 
        print "and I'm woman,"
    end
    puts "and my phone is #{@phone}"
  end
  def Friend.our_common_friend
    puts "We are all friend of #{@@myname}."
  end
end
f1 = Friend.new("Susan","F","550-0123")
f2 = Friend.new("Tom","M","555-43523")
f1.hello
f2.hello
Friend.our_common_friend

x = 3
y = 4

x,y = y,x

puts x
puts y
