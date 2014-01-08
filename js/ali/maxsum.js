var arr = [ 9, -12, 120, 8, -20, 100, 30, -89, 20 ];
console.log(arr);

function maxsum(arr) {
    var sum = 0;
    var b = 0;
    for (var i=0, l=arr.length; i<l; i++) {
        if (b < 0) {
            b = arr[i];
        } else {
            b += arr[i];
        }
        if (sum < b) {
            sum = b;
        }
    }
    return sum;
}

console.log(maxsum(arr));

var arr2 = [3, -1, 4, -2, -10, 9, 0, -3];
console.log(maxsum(arr2));
