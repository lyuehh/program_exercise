# years = (2010..2013).to_a
years = [2014]

years.each do |y|
    file  = "./txt//#{y}.txt"
    File.open(file).each do |f|
        puts "#{f} .."
        system "cd pic/#{y}; http_proxy=127.0.0.1:8087 wget #{f}"
    end
    sleep 5
    puts 'sleep ...'
end
