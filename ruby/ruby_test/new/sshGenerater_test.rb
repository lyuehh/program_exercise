require "rubygems"
require "activerecord"
require "mysql"


#----------------------------------在这里改数据库名---------------------------------------------------------------------
m = Mysql.new("localhost","root","root","test3")
tables1 = m.list_tables
m.close

tables = []

tables1.each do |t|
  t = t.split("")
  t[-1] = nil
  tables << t.join.capitalize
end

puts "1.数据库里所有的表:"
p tables1

puts "2.处理后的表，去除最后的s，大写首字母"
p tables

puts "3.生成相应的对应表的文件夹--ok"

tables.each do |t|
  unless File.exist?(t)
    Dir.mkdir(t.downcase)
  end
end

puts "4.生成Service文件夹下的代码--ok"

unless File.exist?("service")
  Dir.mkdir("service")
end
Dir.chdir("service")

tables.each do |t|
  File.open("#{t}Manager.java","w") do |f|
    f.puts "package com.www.service;"
    
    f.puts "import org.springframework.stereotype.Service;"
    f.puts "import org.xju.base.service.DefaultEntityManager;"
    f.puts "import com.www.entity.#{t};"
    
    f.puts "@Service"
    f.puts "public class #{t}Manager extends DefaultEntityManager<#{t}>{"
    f.puts "}"
  end
end

puts "5.得到每个表的所有字段"
ActiveRecord::Base.establish_connection(
  :adapter   => "mysql",
  :host      => "localhost",
  :username  => "root",
  :password  => "root",
  :database  => "test3"
)

tables.each_with_index do |t,i|
  string = %[
    class #{t} < ActiveRecord::Base   \n
      $column#{i} = column_names      \n
     end                              \n
     puts "表#{i}:#{t}的字段"         \n
     $column#{i}.each do |c|          \n
     p c.capitalize                   \n
     end                              \n
  ]
  eval(string)
  
end

puts "6.生成web文件夹下的代码--ok"
Dir.chdir("..")
unless File.exist?("web")
  Dir.mkdir("web")
end
Dir.chdir("web")

tables.each do |t|
  File.open("#{t}Action.java","w") do |f|
    
    f.puts "package com.www.web;"
    f.puts "\n"
    f.puts "import java.util.Date;"
    f.puts "import java.util.List;"
    f.puts "\n"
    f.puts "import javax.annotation.Resource;"
    f.puts "import javax.servlet.http.HttpServletRequest;"
    f.puts "import javax.servlet.http.HttpServletResponse;"
    f.puts "\n"
    f.puts "import org.apache.struts.action.ActionForm;"
    f.puts "import org.apache.struts.action.ActionForward;"
    f.puts "import org.apache.struts.action.ActionMapping;"
    f.puts "import org.apache.struts.actions.DispatchAction;"
    f.puts "\n"
    f.puts "import com.www.entity.Note;"
    f.puts "import com.www.service.NoteManager;"
    f.puts "\n"
    f.puts "public class #{t}Action extends DispatchAction {"
    f.puts "\n"
    f.puts "  @Resource"
    f.puts "  private #{t}Manager #{t.downcase}manager;" 
    
  end
end