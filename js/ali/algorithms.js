
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
    var i, l = str.length;
    var last = str[0];
    var ret = "";
    var count = 1;
    for (i=1; i<l; i++) {
        if (str.charAt(i) === last) {
            count++;
        } else {
            ret += last + count;
            last = str.charAt(i);
            count = 1;
        }
    }
    if (ret.length > str.length) {
        return str;
    } else {
        return ret;
    }
}

var str = "aaabccdde";
console.log(str_compress(str));
console.log(str_compress("asdfghkl"));

//一个有序数组的元素经过循环移动,元素的顺序可能变为“3 4 5 6 7 1 2”。怎样才能找出数组中最小的那个元素?假设数组中的元素各不相同。

function minX(arr) {
    // var l = arr.length - 1;
    // var m = parseInt(l/2, 10);
    var low = 0, high = arr.length - 1;
    var left = arr[0], right = arr[arr.length-1];
    while (low <= high) {
        var m = parseInt((low + high) / 2, 10);
        if (arr[m] < left) {
            high = m - 1;
        } else if (arr[m+1] > right) {
            low = m + 1;
        } else {
            return m;
        }
    }
    return -1;
}

var minarr = [4,5,6,7,1,2,3];
console.log(minX(minarr));
