class A
  local = 'A1'
  LOCAL = 'A2'
  class B
    #puts local 出错，内部类不可以访问外部类的局部变量
    puts LOCAL #不出错，LOCAL是常量
  end
end

local2 = 'Hello'
class C
  #puts local2 无法访问，因为local2是顶级对象的Object的局部变量，也是一个顶级变量
end


