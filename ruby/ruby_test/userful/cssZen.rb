require "open-uri"

("001".."202").each do |f|
  open("http://www.csszengarden.com/#{f}/#{f}.css") do |i|
    File.open("#{f}.css","w") do |d|
      d.puts i.read
    end
  end
end