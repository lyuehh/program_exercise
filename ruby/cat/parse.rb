require 'nokogiri'

def get_src(doc)
    imgs = []
    doc.css('.ently_text img').each do |l|
        imgs.push(l.attr('src'))
    end

    imgs_with_out_gif = imgs.select {|l| !l.include?('gif')}

    imgs_with_out_ads = imgs_with_out_gif.select do |l|
        begin
            l.split('/')[7].length == 13
        rescue NoMethodError
            puts l.split('/')
        end
    end
    imgs_with_out_ads
end

dates = (201401..201412).to_a
year = 2014

dates.each do |f|
    f1 = "./html/#{year}/#{f}.html"
    f2 = "./html/#{year}/#{f}-1.html"
    f3 = "./html/#{year}/#{f}-2.html"
    f4 = "./html/#{year}/#{f}-3.html"
    f5 = "./html/#{year}/#{f}-4.html"

    doc1 = Nokogiri::HTML(File.read(f1))
    doc2 = Nokogiri::HTML(File.read(f2))
    doc3 = Nokogiri::HTML(File.read(f3))
    doc4 = Nokogiri::HTML(File.read(f4))
    doc5 = Nokogiri::HTML(File.read(f5))

    imgs1 = get_src(doc1)
    imgs2 = get_src(doc2)
    imgs3 = get_src(doc3)
    imgs4 = get_src(doc4)
    imgs5 = get_src(doc5)

    puts imgs1
    puts imgs2
    puts imgs3
    puts imgs4
    puts imgs5
end
