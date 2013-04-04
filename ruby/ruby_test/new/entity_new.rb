require "iconv"

#约定如下：
#实体名为大写字母开头的名词单数
#数据库表名为全小写的名词复数
#外键全部为类似名词单数+_id，如user_id
#属性全部为小写，2个以上单以_分割，如 card_no
#一对多时，多的一方为Set集合,需要写明，且属性为类型+s，如Set<Address> attresss,
#默认除Integer,String,Date,外的其他属性为其他实体
#一对一时,默认前面的是主，后面的其他实体为辅
#默认一对多和多对多均为双向的
#默认多对多时 前面的为主控方,且联接表名为名词复数+_,如users_groups


#-------------------------写实体和属性-----------------------------
string = [["User","Integer:id;String:name;String:password;Card:card;Set<Address>:addresss;Set<Group>:groups;Integer:age"],
#string = [["User","Integer:id;String:name;String:password;Card:card;Set<Address>:addresss;Set<Group>:groups;Integer:age"],
["Card","Integer:id;String:card_no;User:user"],
["Group","Integer:id;String:name;Set<User>:users;Date:created_at"],
["Address","Integer:id;String:street;User:user"]]

#------------------------cardNo会出问题-----------------------------------------------------
unless File.exist?("entity")
  Dir.mkdir("entity")
end
Dir.chdir("entity")
#生成实体类
string.each do |s|
  file_name = s[0]
  File.open("#{file_name}.java","w") do |f|
    type_attrs = s[1].split(";")
    
    f.puts "package com.www.entity;"
    f.puts "\n"
    f.puts "import java.io.Serializable;"
    f.puts "import java.util.*;"
    f.puts "\n"
    f.puts '@SuppressWarnings("serial")'
    f.puts "public class #{file_name} implements Serializable{"
    
    0.upto(type_attrs.length-1) do |t|
      type = type_attrs[t.to_i].split(":")[0]
      attr = type_attrs[t.to_i].split(":")[1]
      case type
        when /Set<.*>/
        f.puts "private #{type} #{attr} = new Hash#{type}();"
      else 
        f.puts "private #{type} #{attr};"
      end
      
    end
    0.upto(type_attrs.length-1) do |t|
      type = type_attrs[t.to_i].split(":")[0]
      attr = type_attrs[t.to_i].split(":")[1]
      
      f.puts "\n"
      f.puts "public #{type} get#{attr.capitalize}() {"
      f.puts "  return #{attr};"
      f.puts "}"
      f.puts "public void set#{attr.capitalize}(#{type} #{attr}) {"
      f.puts "  this.#{attr} = #{attr};"
      f.puts "}"
    end
    f.puts "}"
  end
end
#生成hibernate配置文件
is_one_to_oneHost = true
is_one_to_many_one = true
is_many_to_many_many1 = true
is_one_to_many_many = true

string.each do |s|
  file_name = s[0]
  File.open("#{file_name}.hbm.xml","w") do |f|
    type_attrs = s[1].split(";")
    
    f.puts "<!DOCTYPE hibernate-mapping PUBLIC"
    f.puts '  "-//Hibernate/Hibernate Mapping DTD 3.0//EN"'
    f.puts '  "http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd">'
    f.puts "\n"
    f.puts '<hibernate-mapping package="com.www.entity">'
    f.puts "<class name='#{file_name}' table='#{file_name.downcase}s'>"
    f.puts '  <id name="id">'
    f.puts '    <generator class="native"/>'
    f.puts '  </id>'
    0.upto(type_attrs.length-1) do |t|
      type = type_attrs[t.to_i].split(":")[0]
      attr = type_attrs[t.to_i].split(":")[1]
      case type
        when "String"
        f.puts "<property name='#{attr}'/>"
        when "Date"
        f.puts "<property name='#{attr}' type='timestamp'/>"
        when "Integer"
        unless attr == "id"
          f.puts "<property name='#{attr}' type='integer'/>"
        end
        when /Set<.*>/
        attr_withs = attr.split("")
        attr_withs[-1] = nil
        attr_type = attr_withs.to_s.capitalize
        string.each_with_index do |s,i|
          #puts s[0] + "---" + attr_type
          #puts s[1].include?("Set<#{file_name}>")
          #puts "..............."
          
          #puts "#{i}...#{s[0] == attr_type}..Set<#{file_name}>...#{s[1].include?('Set<#{file_name}>')}"
          
          if(s[0] == attr_type)&&(s[1].include?("Set<#{file_name}>")) #表示多对多
            if is_many_to_many_many1 #主控方
              f.puts "    <set name='#{attr}' cascade='save-update' table='#{file_name.downcase}s_#{attr}' inverse='true'>"
              f.puts "      <key column='#{file_name.downcase}_id'/>"
              f.puts "      <many-to-many class='#{attr_type}' column='#{attr_type.downcase}_id'/>"
              f.puts "    </set>"
              is_many_to_many_many1 = false
            else                  
              f.puts "    <set name='#{attr}' table='#{attr}_#{file_name.downcase}s'>"
              f.puts "      <key column='#{file_name.downcase}_id'/>"
              f.puts "      <many-to-many class='#{attr_type}' column='#{attr_type.downcase}_id'/>"
              f.puts "    </set>"
            end
          elsif (s[0] == attr_type)&&(s[1].include?("#{file_name}"))      #表示一对多
            if is_one_to_many_one   #第一次循环，1的一方配一个Set集合
              f.puts "    <set name='#{attr}' cascade='save-update'  inverse='true'>"
              f.puts "      <key column='#{file_name.downcase}_id'/>"
              f.puts "      <one-to-many class='#{attr_type}'/>"
              f.puts "    </set>"
              is_one_to_many_one = false
              #else #后面的循环，多的一方配一个many_to_one
              #  f.puts "<many-to-one name='#{attr}' column='#{attr}_id'-------------/>"
            end
          end
        end
      else #一对一或多对一的多的一方
        string.each_with_index do |s,i|
          if(s[0] == type)&&(s[1].include?("Set<#{file_name}>")) #表示一对多中，多的一方
            f.puts "<many-to-one name='#{attr}' column='#{attr}_id'/>"
          elsif(s[0] == type)&&(is_one_to_oneHost) #表示一对一中第一个出现的1，默认为主控方
            f.puts "<one-to-one name='#{attr}' cascade='all' property-ref='#{file_name.downcase}'/>"
            is_one_to_oneHost = false
          elsif(s[0] == type)#表示一对一中后出现的1，默认为辅
            f.puts "<many-to-one name='#{attr}' column='#{attr}_id' unique='true' />"
          end
        end
      end
      
    end
    
    f.puts '</class>'
    f.puts '</hibernate-mapping>'
  end
end
