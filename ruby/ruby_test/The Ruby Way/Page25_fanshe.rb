# puts your code here
puts "abc".class 
puts 234.class 
class Animal
end
class Dog < Animal
end
rover = Dog.new
puts rover.class 

if rover.is_a? Dog
  puts "Of course he is."
end
if rover.kind_of? Dog
  puts "Yes,still a dog."
end
if rover.kind_of? Animal
  puts "Yes,he's an animal.too."
end

puts Object.superclass
puts Dog.superclass