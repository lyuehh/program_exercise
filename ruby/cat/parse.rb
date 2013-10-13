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

dates = (201301..201308).to_a
year = 2013

dates.each do |f|
    f1 = "./#{year}/#{f}.html"
    f2 = "./#{year}/#{f}-1.html"
    f3 = "./#{year}/#{f}-2.html"
    doc1 = Nokogiri::HTML(File.read(f1))
    doc2 = Nokogiri::HTML(File.read(f2))
    doc3 = Nokogiri::HTML(File.read(f3))

    imgs1 = get_src(doc1)
    imgs2 = get_src(doc2)
    imgs3 = get_src(doc3)

    puts imgs1
    puts imgs2
    puts imgs3
end
