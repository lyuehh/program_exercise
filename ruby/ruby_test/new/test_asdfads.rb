string = [
["User","Integer:id;String:name;String:password;Integer:age;Date:created_at;Date:updated_at",
    "has_one:Card;has_many:Address;has_many_and_belongs_to:Group"],
["Card","Integer:id;String:card_no",
    "belongs_to:User"],
["Group","Integer:id;String:name;Date:created_at;Date:updated_at",
    "has_many_and_belongs_to:User"],
["Address","Integer:id;String:street",
    "belongs_to:User"]]


#返回包含所有实体的数组
def string.entity_names 
  a = []
  self.each do |s|
    a << s[0]
  end
  return a
end

class String
  #返回某个实体的所有属性
  def type_attrs
    return self.split(";")
  end
  #返回某个实体的所有关联关系
  def relations
    return (self.include?(";"))?self.split(";"):self.to_a
  end
end

p string.entity_names
p string[0][1].type_attrs
p string[0][2].relations
