require 'open-uri'
require 'nokogiri'
require 'pry'

doc = Nokogiri::HTML(File.read('./aa.html'))

imgs = []
doc.css('.ently_text img').each do |l|
    imgs.push(l.attr('src'))
end

imgs_with_out_gif = imgs.select {|l| !l.include?('gif')}

imgs_with_out_ads = imgs_with_out_gif.select do |l|
    l.split('/')[7].length == 13
end

puts imgs_with_out_ads


def get_src(doc)
    imgs = []
    doc.css('.ently_text img').each do |l|
        imgs.push(l.attr('src'))
    end

    imgs_with_out_gif = imgs.select {|l| !l.include?('gif')}

    imgs_with_out_ads = imgs_with_out_gif.select do |l|
        l.split('/')[7].length == 13
    end
end