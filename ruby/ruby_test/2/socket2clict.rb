#����һ��������Ĵ���
require 'socket'
socket = TCPSocket.new("127.0.0.1",30000)
while gets
  socket.print $_
end
socket.close