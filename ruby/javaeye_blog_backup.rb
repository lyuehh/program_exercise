#!/usr/bin/env ruby
# encoding: UTF-8

%w(cgi iconv open-uri openssl fileutils rexml/document).each { |lib| require lib }

# this dirty line is used to pass the ssl verify. This script can 
# execute successfully on my ArchLinux. You can try to comment it.
# And in ruby 1.9, you can pass a hash to open-uri instead of this.
# open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE) { bla...
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# Thanks to http://rednaxelafx.javaeye.com/blog/588507
# String#mgsub taken from Ruby Cookbook, Recipe 1.18
class String  
  def mgsub(key_value_pairs = [].freeze)  
    regexp_fragments = key_value_pairs.collect {|k,v| k }  
    gsub(Regexp.union(*regexp_fragments)) do |match|  
      key_value_pairs.detect {|k,v| k =~ match}[1]  
    end  
  end  
end  


class GReader
	TEMPLATE = <<-HTML
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
		"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<title>_title_</title>
			</head>
			<body>
        _link_
        _time_
				_body_
			</body>
		</html>
	HTML

	def initialize(options = {})
    @g_sid = get_sid options[:g_name], options[:g_pwd]
    @g_auth = get_auth options[:g_name], options[:g_pwd]
    @blog_rss = "http://#{options[:domain]}/rss"
    @header = {
      "UserAgent" => "JavaEye Blog Backup Script", 
      "Cookie" => "SID=#@g_sid",
      "Authorization" => "GoogleLogin auth=#@g_auth"
    }
    @reader_path = "https://www.google.com/reader/atom/feed/#{CGI.escape @blog_rss}?n=44444"
    @dir = FileUtils.makedirs(options[:dir] ||= options[:domain])
    # Thanks to http://rednaxelafx.javaeye.com/blog/588507
    # In ruby 1.9, makedirs will give you an array
    Dir.chdir @dir rescue Dir.chdir @dir.first 
  end

  def fetch
    puts "Downloading..."
    puts @reader_path
    open(@reader_path, @header) do |response|
      REXML::Document.new(response).elements.each("*/entry") do |entry|
        begin
          title = entry.elements["title"].text
          link = entry.elements["link"].attributes['href']
          time = Time.parse(entry.elements["published"].text).strftime("%Y-%m-%d") rescue '' 
          body = (entry.elements["summary"] || entry.elements["content"]).text.sub(/<span style="color:red">\s*<a.*style="color:red">((已有 <strong>\d+<\/strong> 人发表留言，猛击-&gt;&gt;<strong>这里<\/strong>&lt;&lt;-参与讨论)|(本文的讨论也很精彩，浏览讨论&gt;&gt;)).*$/m, '')
          filename = "#{title}.html"


          # Thanks to http://rednaxelafx.javaeye.com/blog/588507
          # For windows user
          if RUBY_PLATFORM =~ /mswin/i
            title = title.mgsub([[%r{\\}, '＼'], [%r{/}, '／'],  
                                [/:/, '：'],    [/\*/, '＊'],  
                                [/\?/, '？'],   [/"/, '“'],  
                                [/</, '＜'],    [/>/, '＞'],  
                                [/\|/, '｜']])  
            filename = Iconv.conv("GB18030", "UTF-8", filename)
          end

          File.open(filename, "w") do |f| 
            f.puts TEMPLATE.sub('_title_', title).sub('_link_', "<h3><a href=#{link} title='原文链接'>#{title}</a></h3>").sub('_time_', time).sub('_body_', body) 
          end
          puts "[Save]	#{filename}"
        rescue Exception => e
          puts "[Error] #{e.message}"
          next
        end
      end
    end
    puts "All files have been saved in #{Dir.pwd}"
  rescue Exception => e
    puts "[Error]	#{e.message}"
  end

  def get_sid(g_name, g_pwd)
    puts "Login..."
    open("https://www.google.com/accounts/ClientLogin?Email=#{g_name}&Passwd=#{g_pwd}") { |res| res.string.split("\n").detect {|l| l =~ /^SID=/ }.strip.sub(/^SID=/,'') }
  rescue Exception => e
    puts "[Error]	login failed. #{e.message}"
    exit
  end

  def get_auth(login, password)
    puts "Auth..."
    open("https://www.google.com/accounts/ClientLogin?Email=#{login}&Passwd=#{password}&service=reader") { |res| res.read.strip.sub(/^SID=.*Auth=/m,'') }
  rescue Exception => e
    puts "[Error]	Auth failed. #{e.message}"
    exit
  end
end

def args(key)
  ARGV.each_with_index do |arg, i|
    return ARGV[i+1] if "-#{key}" == arg
  end
  nil
end

if ARGV.size < 5 || args('u').nil? || args('p').nil? || ARGV.detect {|arg| '-h' == arg}
  DATA.each_line { |line| puts line if (line =~ /^Usage/)..(line =~ /cnnic.javaeye.com$/) }
  exit
end

GReader.new(:domain => ARGV.last,
            :dir => args('d'),
            :g_name => args('u'),
            :g_pwd => args('p')).fetch


__END__
Usage: ruby javaeye_blog_backup.rb OPTIONS your-javaeye-domain

your-javaeye-domain should be robbin.javaeye.com if your javaeye blog is http://robbin.javaeye.com

OPTIONS
-u  your google account
-p  your google password
-d  directory you'd love to save your blog files. NOT REQUIRED. default: your-javaeye-domain (eg. robbin.javaeye.com)

Example
ruby javaeye_blog_backup.rb -u bitch -p fuckgfw cnnic.javaeye.com
