require 'nokogiri'

files = ["./1.html", "./2.html", "./3.html", "./4.html", "./5.html", ]

files.each do |f|
    doc2 = Nokogiri::HTML(File.read(f))
    doc2.css('.item a').each do |d|
        puts d.text.split('/')[0]
    end
end