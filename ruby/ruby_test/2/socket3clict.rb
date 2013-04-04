#在这一下输入你的代码
require 'socket'
SERVER_ADDRESS = '127.0.0.1'
SERVER_PORT = 30000
socket = TCPSocket.new(SERVER_ADDRESS,SERVER_PORT)
read = Thread.new do 
  while socket.gets
    print '服务器响应: '
    puts $_
  end
end
while gets 
  socket.puts($_)
end
socket.close