require "from"

class InfoReader
	include From
	def start
		From::Movie.new("放放电影","http://www.ffdy.cc/","html/movie.html").getInfo
		From::Douban.new("豆瓣info","http://api.douban.com/people/lyuehh/miniblog/contacts?start-index=1&max-results=10").getInfo
	end
end

InfoReader.new.start