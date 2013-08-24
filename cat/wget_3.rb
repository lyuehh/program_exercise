files = ["./34.txt"]

files.each do |y|
    file  = y
    puts file
    File.open(file).each do |f|
        puts "#{f} .."
        system "http_proxy=127.0.0.1:8087 wget #{f}"
    end
    sleep 5
    puts 'sleep ...'
end