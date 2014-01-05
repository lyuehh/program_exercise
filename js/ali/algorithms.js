
function binary_search(arr, x) {
    var low = 0,
        high = arr.length - 1;
    while (low <= high) {
        var m = parseInt((low+high)/2, 10);
        if (x === arr[m]) {
            return m;
        } else if (x > arr[m]) {
            low = m + 1;
        } else {
            high = m - 1;
        }
    }
    return -1;
}

var arr = [1,2,3,4,5];
console.log(binary_search(arr, 1));
console.log(binary_search(arr, 2));
console.log(binary_search(arr, 3));
console.log(binary_search(arr, 4));
console.log(binary_search(arr, 5));
console.log(binary_search(arr, 22));

console.log('insert sort');

function insert_sort(arr) {
    var i, j, l = arr.length;
    for (i=1; i<l; i++) {
        for (j=i; j>0&&(arr[j-1] > arr[j]); j--) {
            var temp = arr[j-1];
            arr[j-1] = arr[j];
            arr[j] = temp;
        }
    }
    return arr;
}

var arr2 = [2,4,5,1,3];
console.log('insert_sort:');
console.log(arr2);
console.log(insert_sort(arr2));

//字符串压缩 aaabccdde -> a3bc2d2e

function str_compress(str) {
    
}

var str = "aaabccdde";
console.log(str_compress(str));
