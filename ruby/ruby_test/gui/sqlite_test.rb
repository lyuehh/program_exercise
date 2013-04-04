#puts here
require "rubygems"
require "sqlite3"

db = SQLite3::Database.new("message.db")
=begin
sql = <<SQL
  create table books(
    title varchar(20),
    author varchar(20)
  );
  insert into books values("book1","author1");
  insert into books values("book2","author2");
SQL

db.execute_batch(sql)

db.execute("select * from books") do |row|
  p row
end
db.close
=end

db.results_as_hash = true
db.execute("select * from books where title='book2'") do |row|
  p row["title"]
  p row["author"]
end
