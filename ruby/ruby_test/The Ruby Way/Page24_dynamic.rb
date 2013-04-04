# puts your code here
#1
def calculate(op1,operator,op2)
  string = op1.to_s + operator + op2.to_s
  eval(string)
end
@alpha = 25
@beta = 12
puts calculate(2,"+",2)
puts calculate(5,"*","@alpha")
puts calculate("@beta","**",3)

#2
puts "Method name: "
meth_name = gets 
puts "Line of code: "
code = gets
string = %[def #{meth_name}\n puts #{code} \n end]
eval(string)
eval(meth_name)