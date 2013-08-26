urls = [
"http://movie.douban.com/top250?format=text",
"http://movie.douban.com/top250?start=50&filter=&format=text",
"http://movie.douban.com/top250?start=100&filter=&format=text",
"http://movie.douban.com/top250?start=150&filter=&format=text",
"http://movie.douban.com/top250?start=200&filter=&format=text",
]

urls.each_with_index do |u, i|
    system "http_proxy=127.0.0.1:8087 curl #{u} > #{i+1}.html"
end