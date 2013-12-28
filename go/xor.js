
//在一个整型数组里，所有的数都重复了两次，仅有两个数是不重复的，如何在时间O(n)和空间O(1)内找出这两个数？
function xor(arr) {
    var x;
    for (var i=0; i<arr.length; i++) {
        x = x ^ arr[i];
    }
    console.log(x);
}

xor([23, 23, 19, 19, 1, 88, 88, 3, 3, 2, 56, 56]);
