require 'open-uri'
require 'nokogiri'
require 'pry'

def get_ed2k_url(doc)
    eles = []
    doc.css('.resod_list a[type=ed2k]').each do |e|
        eles.push(e.attr('href'))
    end
    eles = eles.select do |e|
        e.include?('HR-HDTV')
    end
    eles[0]
end


file = "./url.a.txt"

urls = []
File.open(file).each do |l|
    urls.push(l) if l[0] == 'h'
end

urls.each do |u|
    doc = Nokogiri::HTML(open(URI.escape(u)))
    puts get_ed2k_url(doc)
end
