Function.prototype.time = function() {
    var t1 = +new Date(),
        foo = this(),
        t2 = +new Date();
    return t2 - t1;
};

Function.prototype.bind = function(obj) {
    var that = this;
    var args = Array.prototype.slice.call(arguments, 1);
    return function() {
        return that.apply(obj, args.concat(Array.prototype.slice.call(arguments)));
    };
};


// 用hash的key来测试唯一性
function unique1(arr) {
    var obj = {};
    var ret = [];
    for (var i=0, l=arr.length; i<l; i++) {
        if (!obj[arr[i]]) {
            ret.push(arr[i]);
            obj[arr[i]] = true;
        }
    }
    // return Object.keys(obj);
    return ret;
}

// 用临时数组来保存
function unique2(arr) {
    var ret = [];
    for (var i=0, l=arr.length; i<l; i++) {
        if (ret.indexOf(arr[i]) === -1) {
            ret.push(arr[i]);
        }
    }
    return ret;
    // return arr;
}

// 先排序, 然后输出不相同的
function unique3(arr) {
    var ret = [];
    ret = arr.sort(function(a, b) {
        return a - b;
    });
    var ret2 = [];
    for (var i=1, l=ret.length+1; i<l; i++) {
        if (ret[i] !== ret[i-1]) {
            ret2.push(ret[i-1]);
        }
    }
    return ret2;
}

// 
function unique4(arr) {
    var ret = [];
    for (var i=0, l=arr.length; i<l; i++) {
        if (arr.indexOf(arr[i]) === i) {
            ret.push(arr[i]);
        }
    }
    return ret;
}


// var arr = [9, 2, 2, 3, 5, 6, 1, 7];

var arr = [];
for (var i=0; i<100000; i++) {
    arr.push(parseInt(Math.random() * 10000000));
}

/*
console.log(arr);
console.log(unique1(arr.slice()));
console.log(unique2(arr.slice()));
console.log(unique3(arr.slice()));
console.log(unique4(arr.slice()));
*/
// console.log(unique1.bind(arr).time());
// console.log(arr.length);
// console.log(unique1(arr).length);
var global = {
    unique1: unique1,
    unique2: unique2,
    unique3: unique3,
    unique4: unique4
};
["unique1", "unique2", "unique3", "unique4"].forEach(function(f) {
    var t1 = +new Date();
    global[f](arr);
    var t2 = +new Date();
    console.log(f + ": " + (t2-t1));
});
