  @imgs = %w{1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16}
    a = %w{1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16}
    #a = 1..16
    a.each do |aa|
      aa = rand(16)
      bb = rand(16)
      c  = @imgs[aa]
      @imgs[aa] = @imgs[bb]
      @imgs[bb] = c
    end

    puts @imgs