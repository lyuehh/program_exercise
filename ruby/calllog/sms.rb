require 'sqlite3'
require 'json'

db = SQLite3::Database.new 'mmssms.db'

send_sms = []
receive_sms = []

send_hash = {}
receive_hash = {}

db.execute('select * from sms') do |row|
  # 对方电话，发送时间，type：2自己 1别人，内容
  # 过滤掉+86

  phone = row[2].include?('+86') ? row[2][3..99] : row[2]
  date = Time.at(row[4] / 1000).to_s.split(' ')[0]
  ((row[9] == 2) ? send_sms : receive_sms).push([phone, date, row[9], row[12]])
  t = ((row[9] == 2) ? send_hash : receive_hash)
  if !t[date]
    t[date] = 1
  else
    t[date] = t[date] + 1
  end
end

send_arr = []
receive_arr = []

send_hash.each do |s|
  send_arr.push({:date => s[0], :count => s[1]})
end
receive_hash.each do |s|
  receive_arr.push({:date => s[0], :count => s[1]})
end


=begin
file = ['send.json', 'receive.json']
file.each do |f|
  if File.exists?(f)
    File.delete(f)
  end
  File.open(f, 'w') do |ff|
    if f == 'send.json'
      ff.puts send_arr.to_json
    else
      ff.puts receive_arr.to_json
    end
  end
end

file = ['send_sms.json', 'receive_sms.json']
file.each do |f|
  if File.exists?(f)
    File.delete(f)
  end
  File.open(f, 'w') do |ff|
    if f == 'send.json'
      ff.puts send_sms.to_json
    else
      ff.puts receive_sms.to_json
    end
  end
end
=end
