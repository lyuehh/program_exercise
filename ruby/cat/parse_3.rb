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


doc1 = Nokogiri::HTML(File.read('./html/2011/201101-3.html'))
doc2 = Nokogiri::HTML(File.read('./html/2012/201201-3.html'))
doc3 = Nokogiri::HTML(File.read('./html/2013/201301-3.html'))
doc4 = Nokogiri::HTML(File.read('./html/2013/201301-4.html'))

imgs1 = get_src(doc1)
imgs2 = get_src(doc2)
imgs3 = get_src(doc3)
imgs4 = get_src(doc4)

#puts imgs1
#puts imgs2
#puts imgs3
puts imgs4