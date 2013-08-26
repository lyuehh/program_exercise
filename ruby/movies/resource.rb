require 'open-uri'
require 'nokogiri'
require 'pry'

def get_resource_url(doc)
    eles = []
    doc.css('.all_search_li2 a').each do |e|
        eles.push(e.attr('href'))
    end

    eles = eles.select do |e|
        e.include?('resource')
    end
    eles[0]
end

file = "./250.b.txt"

lines = []
File.open(file).each do |l|
    lines.push(l)
end

lines.each do |l|
    url = "http://www.yyets.com/search/index?keyword=#{l}&type="
    doc = Nokogiri::HTML(open(URI.escape(url)))
    puts get_resource_url(doc)
end

=begin
t = lines[0]
url = "http://www.yyets.com/search/index?keyword=#{t}&type="
doc = Nokogiri::HTML(open(URI.escape(url)))

=end