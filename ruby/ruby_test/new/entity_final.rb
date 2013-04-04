
string = "Integer:id,String:name,String:password,Date:created_at,Date:updated_at"
p a = string.split(",")
p a.length


File.open("b.java","w") do |cc|
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
end

File.open("b.as","w") do |cc|
  0.upto(a.length-1) do |aa|
    c = a[aa.to_i].split(':')[0]
    d = a[aa.to_i].split(':')[1]
    case c
      when "Integer"
      c = "Number"
    end
    cc.puts "var #{d}:#{c};"
  end
end

