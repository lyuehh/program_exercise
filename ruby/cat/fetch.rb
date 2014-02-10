dates = (201308..201312).to_a
year = 2013

# page 1
dates.each do |d|
    system "http_proxy=127.0.0.1:8087 curl http://kagonekoshiro.blog86.fc2.com/blog-date-#{d}.html > #{year}/#{d}.html"
end

# page 2
dates.each do |d|
    system "http_proxy=127.0.0.1:8087 curl http://kagonekoshiro.blog86.fc2.com/blog-date-#{d}-1.html > #{year}/#{d}-1.html"
end

# page 3
dates.each do |d|
    system "http_proxy=127.0.0.1:8087 curl http://kagonekoshiro.blog86.fc2.com/blog-date-#{d}-2.html > #{year}/#{d}-2.html"
end

# page 4
dates.each do |d|
    system "http_proxy=127.0.0.1:8087 curl http://kagonekoshiro.blog86.fc2.com/blog-date-#{d}-3.html > #{year}/#{d}-3.html"
end

# page 5
dates.each do |d|
    system "http_proxy=127.0.0.1:8087 curl http://kagonekoshiro.blog86.fc2.com/blog-date-#{d}-4.html > #{year}/#{d}-4.html"
end