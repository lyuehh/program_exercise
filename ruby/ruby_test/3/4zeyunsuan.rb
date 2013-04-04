def calc(op1,operator,op2)
    string = op1.to_s + operator + op2.to_s
    eval(string)
end

@alpha = 25
@beta = 2

puts calc(2,"+",2)
puts calc(5,"*","@alpha")
puts calc("@beta","**",3)