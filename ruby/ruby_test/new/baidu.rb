require "open-uri"

data=nil

uris = []
reg = /.*(http:\/\/i.*.jpg)/

threads = []

a = File.new("a.html","w")

t = open("http://www.qq.com",
    "User-Agent" =>   "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2 QQDownload/1.7",
    "Accept" =>  "image/png,image/*;q=0.8,*/*;q=0.5",
    "Accept-Language" =>  "zh-cn,zh;q=0.5",
    "Accept-Encoding" =>  "gzip,deflate",
    "Accept-Charset" =>  "GB2312,utf-8;q=0.7,*;q=0.7",
    "Keep-Alive" => "115",
    "Connection" =>  "keep-alive",
    "Referer" => "http://www.google.cn",
    "Pragma" =>  "no-cache",
    "Cache-Control" => "no-cache"
) do |f| 
  a.puts f.read
end  