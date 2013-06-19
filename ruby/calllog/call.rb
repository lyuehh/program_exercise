require 'sqlite3'
require 'json'

db = SQLite3::Database.new 'contacts2.db'

send_call = []
send_hash = {}

db.execute('select * from calls') do |row|
  # 对方电话，发送时间，type：2自己 1别人，内容
  # 过滤掉+86
  if row[2] != ''
    date = Time.at(row[2] / 1000).to_s.split(' ')[0]
    send_call.push([date])

    t = send_hash
    if !t[date]
      t[date] = 1
    else
      t[date] = t[date] + 1
    end
  end
end

send_arr = []

send_hash.each do |s|
  send_arr.push({:date => s[0], :count => s[1]})
end


=begin
file = ['send_call.json']
file.each do |f|
  if File.exists?(f)
    File.delete(f)
  end
  File.open(f, 'w') do |ff|
    ff.puts send_arr.to_json
  end
end
=end