require 'open-uri'
require 'nokogiri'

def check
  doc = Nokogiri::HTML(open('http://news.mtime.com/pix/2013/05/31/378246.html'))
  doc.css('.c_000').each do |c|
    puts c.content
  end
  doc.css('.lh20').each do |c|
    puts c.content.gsub!('更多','').gsub!('>>', '')
  end

  doc.css('a').each do |c|
    puts c
  end
end

check

=begin
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
=end
