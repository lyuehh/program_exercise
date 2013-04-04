require "rubygems"
require "sqlite3"

#file = File.new("sd.txt")
#db = SQLite3::Database.open("ip_data.db")

def init_database
        db = SQLite3::Database.open("ip_data.db")
	sql = <<SQL
	create table ip(
	a_attr varchar(200) not null,
	z_attr varchar(200) not null,
	d_attr varchar(200) not null
	);
SQL
	db.execute_batch(sql)
	db.close
end

#初始化数据库 初始化完后注释掉
#init_database

#保存方法
#def save(a,z,d)
#	db = SQLite3::Database.open("ip_data.db")
#	db.execute("insert into ip values(?,?,?)",a,z,d)
#	db.close
#end

db = SQLite3::Database.open("ip_data.db")
file = File.new("sd.txt")
#循环插入数据
file.each do |line|
	a = line.split
	db.execute("insert into ip values(?,?,?)",a[0],a[1],a[2..10].join(" "))
	#save(a[0],a[1],a[2..10].join(" ")) 
end
db.close

