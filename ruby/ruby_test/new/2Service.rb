
string = [
["User","Integer:id;String:name;String:password;Integer:age;Date:created_at;Date:updated_at",
    "has_one:Card;has_many:Address;has_many_and_belongs_to:Group"],
["Card","Integer:id;String:card_no",
    "belongs_to:User"],
["Group","Integer:id;String:name;Date:created_at;Date:updated_at",
    "has_many_and_belongs_to:User"],
["Address","Integer:id;String:street",
    "belongs_to:User"]]

unless File.exist?("service")
  Dir.mkdir("service")
end
Dir.chdir("service")

string.each do |s|
  entity = s[0]
  File.open("#{entity}Manager.java","w") do |f|
    
    f.puts "package com.www.service;
    import org.springframework.stereotype.Service;
    import org.xju.base.service.DefaultEntityManager;
    import com.www.entity.#{entity};
    @Service
    public class CardManager extends DefaultEntityManage<#{entity}> {
    }"
  end
end