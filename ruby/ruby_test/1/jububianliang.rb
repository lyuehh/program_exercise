class A
  local = "属于类的局部变量"
  puts local
end

def info
  local = "属于方法的局部变量"
  puts local
end
info;
module B
  local = "属于模块里的局部变量"
  puts local
end