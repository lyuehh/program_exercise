#��������������Ĵ���
require 'socket'
server = TCPServer.new(30000)
socket = server.accept()
socket.puts 'Form Server'
socket.colse;