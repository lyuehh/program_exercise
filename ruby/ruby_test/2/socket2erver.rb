#��������������Ĵ���
require 'socket'
server = TCPServer.new(30000)
socket = server.accept()
buffer = nil
puts buffer while buffer = socket.gets
socket.colse;