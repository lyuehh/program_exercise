#在这以下输入你的代码
require 'socket'
server = TCPServer.new(30000)
clients = []
while true
  Thread.new(server.accept) do |socket|
  print(socket,"连接进来的了\n")
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
