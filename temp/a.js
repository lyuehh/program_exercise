var num = 600851475143
var res = 2
while(res != num) {
  if(num % res === 0) {
    num = num / res
  } else {
    res += 1
  }
}
console.log(res);
