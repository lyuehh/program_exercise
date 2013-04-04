#在这一下输入你的代码
def temp_chart(temps)
  for temp in temps
    converted = yield(temp)
    puts "#{temp}\t#{converted}"
  end
end

celsiuses = [0,10,20,30,40,50,60,70,80,90,100]
temp_chart(celsiuses) {|cel| cel*9/5+32}