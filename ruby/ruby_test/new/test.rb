require "rubygems"
require "activerecord"
require "mysql"

m = Mysql.new("localhost","root","root","note")
tables1 = m.list_tables
m.close

tables = []

tables1.each do |t|
  t = t.split("")
  t[-1] = nil
  tables << t.join.capitalize
end

#$column1,$column2,$column3,$column4,$column5,$column6,$column7 = [],[],[],[],[],[],[]

ActiveRecord::Base.establish_connection(
  :adapter   => "mysql",
  :host      => "localhost",
  :username  => "root",
  :password  => "root",
  :database  => "note"
)

tables.each_with_index do |t,i|
  string = %[
    class #{t} < ActiveRecord::Base    \n
      $column#{i} = column_names       \n
     end
  ]
  eval(string)
end
p $column1
p $column0




