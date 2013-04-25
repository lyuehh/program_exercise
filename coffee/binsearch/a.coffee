index = (list,target) ->
  [low,high] = [0,list.length]
  while low < high
    mid = (low + high) >> 1
    val = list[mid]
    return mid if val is target
    if val < target then low = mid + 1 else high = mid
  return -1

console.log 2 is index [10,20,30],30
console.log 4 is index [-97,35,67,88,1200],1200