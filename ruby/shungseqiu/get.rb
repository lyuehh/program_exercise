require 'json'
require 'open-uri'
require 'nokogiri'
require 'pry'

years = (2003..2014).to_a
p years

base_url = 'http://www.3dcp.cn/zs/gonggao.php?type=ssq&year='

years.each do |y|
    url = base_url + y
    doc = Nokogiri::HTML(open(url))
end
