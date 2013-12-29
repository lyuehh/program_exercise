// 1
var num1 = 5,
num2 = 10,
result = num1+++num2;

console.log(result);
console.log(num1);
console.log(num2);

// 2
console.log('2:');
var num1 = "10";
var num2 = "9";

console.log(num1 < num2);
console.log(+num1 < num2);
console.log(num1 + num2);
console.log(+num1 + num2);

// 3
var o = {
        x: 8,
        valueOf: function(){
            return this.x + 2;
        },
        toString: function(){
            return this.x.toString();
        }
    },
    result = o < "9";

console.log(result);
console.log(o);
