#����һ��������Ĵ���
require 'socket'
socket = TCPSocket.new("127.0.0.1",30000)
puts socket.gets
socket.close