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

string = [
["User","Integer:id;String:name;String:password;Integer:age;Date:created_at;Date:updated_at",
    "has_one:Card;has_many:Address;has_many_and_belongs_to:Group"],
["Card","Integer:id;String:card_no",
    "belongs_to:User"],
["Group","Integer:id;String:name;Date:created_at;Date:updated_at",
    "has_many_and_belongs_to:User"],
["Address","Integer:id;String:street",
    "belongs_to:User"]]

unless File.exist?("entity2")
  Dir.mkdir("entity2")
end
Dir.chdir("entity2")


string.each do |s|
  file_name = s[0]
  File.open("#{file_name}.java","w") do |f|
    type_attrs = s[1].split(";")
    #relationship = s[2].split(";")
    if s[2].include?(";")
      relationship = s[2].split(";")
    else
      relationship = s[2].to_a
    end
    
    f.puts "package com.www.entity;"
    f.puts "\n"
    f.puts "import java.io.Serializable;"
    f.puts "import java.util.*;"
    f.puts "\n"
    f.puts '@SuppressWarnings("serial")'
    f.puts "public class #{file_name} implements Serializable{"
    
    0.upto(type_attrs.length-1) do |t|  #基础属性
      type = type_attrs[t.to_i].split(":")[0]
      attr = type_attrs[t.to_i].split(":")[1]
      f.puts "private #{type} #{attr};"
    end
    0.upto(relationship.length-1) do |t| #关联属性
      relation = relationship[t.to_i].split(":")[0]
      entity = relationship[t.to_i].split(":")[1]
      case relation
        when "has_one"
        f.puts "private #{entity} #{entity.downcase};"
        when "belongs_to"
        f.puts "private #{entity} #{entity.downcase};"
        when "has_many"
        f.puts "private Set<#{entity}> #{entity.downcase}s = new HashSet<#{entity}>();"
        when "has_many_and_belongs_to"
        f.puts "private Set<#{entity}> #{entity.downcase}s = new HashSet<#{entity}>();"
      end
    end
    0.upto(type_attrs.length-1) do |t|   #基础属性的getter和setter
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
    0.upto(relationship.length-1) do |t| #关联属性的getter和setter
      relation = relationship[t.to_i].split(":")[0]  #has_one,belongs_to..
      entity = relationship[t.to_i].split(":")[1]    #User,Card
      f.puts "\n"
      
      case relation
        when "has_one","belongs_to"
        f.puts "public #{entity} get#{entity.capitalize}() {"
        f.puts "  return #{entity.downcase};"
        f.puts "}"
        f.puts "public void set#{entity.capitalize}(#{entity} #{entity.downcase}) {"
        f.puts "  this.#{entity.downcase} = #{entity.downcase};"
        f.puts "}"
        when "has_many","has_many_and_belongs_to"
        f.puts "public Set<#{entity}> get#{entity.capitalize}s() {"
        f.puts "  return #{entity.downcase}s;"
        f.puts "}"
        f.puts "public void set#{entity.capitalize}s(Set<#{entity}> #{entity.downcase}s) {"
        f.puts "  this.#{entity.downcase}s = #{entity.downcase}s;"
        f.puts "}"
      end
    end
    f.puts "}"
  end
end
many_to_many_1 = true

string.each do |s|
  file_name = s[0]
  File.open("#{file_name}.hbm.xml","w") do |f|
    type_attrs = s[1].split(";")
    if s[2].include?(";")
      relationship = s[2].split(";")
    else
      relationship = s[2].to_a
    end
    #基础
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
      end
    end
    
    0.upto(relationship.length-1) do |t| #关联属性的getter和setter
      relation = relationship[t.to_i].split(":")[0]  #has_one,belongs_to..
      entity = relationship[t.to_i].split(":")[1]    #User,Card
      f.puts "\n"
      
      case relation
        when "has_one"
        f.puts "<one-to-one name='#{entity.downcase}' cascade='all' property-ref='#{file_name.downcase}'/>"
        when "belongs_to"
        string.each do |s|
          #relationship2 = (s[2].include?(";"))?s[2].split(";"):s[2].to_a
          if(s[0]==entity)&&(s[2].include?("has_one:#{file_name}"))
            f.puts "<many-to-one name='#{s[0].downcase}' column='#{s[0].downcase}_id' unique='true'/>"
          elsif(s[0]==entity)&&(s[2].include?("has_many:#{file_name}"))
            f.puts "<many-to-one name='#{s[0].downcase}' column='#{s[0].downcase}_id'/>"
          end
        end
        when "has_many"
        f.puts "    <set name='#{entity.downcase}s' cascade='save-update'  inverse='true'>"
        f.puts "      <key column='#{file_name.downcase}_id'/>"
        f.puts "     <one-to-many class='#{entity}'/>"
        f.puts "    </set>"
        when "has_many_and_belongs_to"
        if many_to_many_1
          f.puts "    <set name='#{entity.downcase}s' cascade='save-update' table='#{file_name.downcase}s_#{entity.downcase}s' inverse='true'>"
          f.puts "      <key column='#{file_name.downcase}_id'/>"
          f.puts "      <many-to-many class='#{entity}' column='#{entity.downcase}_id'/>"
          f.puts "    </set>"
          many_to_many_1 = false
        elsif !many_to_many_1
          f.puts "    <set name='#{entity.downcase}s'  table='#{entity.downcase}s_#{file_name.downcase}s'>"
          f.puts "      <key column='#{file_name.downcase}_id'/>"
          f.puts "      <many-to-many class='#{entity}' column='#{entity.downcase}_id'/>"
          f.puts "    </set>"
        end
      end
    end
    
    f.puts '</class>'
    f.puts '</hibernate-mapping>'
  end
end
#生成service

