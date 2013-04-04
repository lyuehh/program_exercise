require "iconv"

entity = "Note"
string = "Integer:id,String:name,String:password,Date:created_at,Date:updated_at"

p a = string.split(",")
p a.length

File.open("#{entity}.java","w") do |cc|
  
  cc.puts "package com.www.entity;"
  cc.puts "\n"
  cc.puts "import java.io.Serializable;"
  cc.puts "import java.util.Date;"
  cc.puts "\n"
  cc.puts '@SuppressWarnings("serial")'
  cc.puts "public class #{entity} implements Serializable{"
  
  0.upto(a.length-1) do |aa|
    c = a[aa.to_i].split(':')[0]
    d = a[aa.to_i].split(':')[1]
    cc.puts "private #{c} #{d};"
  end
  0.upto(a.length-1) do |aa|
    c = a[aa.to_i].split(':')[0]
    d = a[aa.to_i].split(':')[1]
    cc.puts "\n"
    cc.puts "public #{c} get#{d.capitalize}() {"
    cc.puts "  return #{d};"
    cc.puts "}"
    cc.puts "public void set#{d.capitalize}(#{c} #{d}) {"
    cc.puts "  this.#{d} = #{d};"
    cc.puts "}"
  end
   cc.puts "}"
end

File.open("b.as","w") do |cc|
  0.upto(a.length-1) do |aa|
    c = a[aa.to_i].split(':')[0]
    d = a[aa.to_i].split(':')[1]
    case c
      when "Integer"
      c = "Number"
    when "String"
      c = "String2"
    end
    cc.puts "var #{d}:#{c};"
  end
 
end

