# puts your code here
def myMethod(a,b,*c)
  print a,b
  c.each do |x| print x end
  puts "..."
end

myMethod(1,2)
myMethod(1,2,3,4)
myMethod(1,2,3,4,5)

str = "Hello,World."
str2 = "Goodbye!"
def str.spell
  self.split(/./).join("-") 
end
str.spell #the print is "H-e-l-l-o-,-W-o-r-l-d-."
#str2.spell #error!