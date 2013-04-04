 words = ["hello", "world", "goodbye", "mars" ] 
    numbers = [1,2,3,4,5,6,7,8,9,10] 

    a = Thread.new{ 
      words.each{ |word| puts( word ) } 
    }

    b = Thread.new{ 
      numbers.each{ |number| puts( number ) } 
    }

		[a,b].each {|t| t.join}