require 'open-uri'
require 'nokogiri'

def check
  doc = Nokogiri::HTML(open('http://www.yyets.com/resource/10733'))
  doc.css('.f14').each do |l|
    if l.to_s.include?('片源')
      puts 'no'
      sleep 60 * 10
    else
      `terminal-notifier -message "可以看了..."`
      puts "haha"
      exit
    end
  end
end

while true
  check
end
