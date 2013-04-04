def doCalc( aNum ) 
		begin 
			result = 100 / aNum.to_i 
		rescue Exception => e                       # executes when there is an error 
			result = 0 
			msg = "Error: " + e 
		else                                        # executes when there is no error 
			msg = "Result = #{result} \n" 
		ensure                                      # always executes 
			msg = "You entered '#{aNum}'. " + msg 
		end 
		return msg 
 end 

 a = gets

puts doCalc(a)