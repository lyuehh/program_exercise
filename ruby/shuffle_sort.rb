def is_sorted(arr)
  arr.each_with_index do |a,i|
    if a > arr[i+1]
      return false
    end
  end
  return true
end

a = [2,1,4,3,6,5]
p is_sorted(a)

def sort(a)
  1.upto(a.length) do |i|
    a.shuffle!
    if is_sorted(a)
      p 'ok'
      return a
    end
  end
end
p sort(a)
