#��������������Ĵ���
require 'socket'
server = TCPServer.new(30000)
clients = []
while true
  Thread.new(server.accept) do |socket|
  print(socket,"���ӽ�������\n")
  clients << socket
  while socket.gets
    clients.each do |client|
      client.puts '----' + $_
      client.flush
    end
  end
  print(socket,"is gone\n")
    clients.delete(socket)
    socket.close
  end
end
