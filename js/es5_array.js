var _each = function(arr, fn) {
  if(arr.forEach) {
    return arr.forEach(fn);
  }
  for(var i=0;i<arr.length;i++) {
    fn(arr[i], i, arr);
  }
};

var _map = function(arr, fn) {
  if(arr.map) {
    return arr.map(fn);
  }
  var results = [];
  _each(function(item, i, a) {
    results.push(fn(item, i, a));
  });
  return results;
};

var _reduce = function(arr, fn, memo) {
  if(arr.reduce) {
    return arr.reduce(fn, memo);
  }
  _each(arr, function(item, i, a) {
    memo = fn(memo, item, i, a);
  });
};

var _filter = function(arr, fn) {
  if(arr.filter) {
    return arr.filter(fn);
  }
  var results = [];
  _each(arr, function(item, i, a) {
    if(fn(item)) {
      results.push(item);
    }
  });
  return results;
};

var arr = [1,2,3,4,5];
console.log(arr);

_each(arr, function(item, i, a) {
  if(item > 2) {
    console.log('i: ' + i + ', item: ' + item);
  }
});

var arr2 = _map(arr, function(item, i, a) {
  return item * item;
});
console.log(arr2);

var arr_sum = _reduce(arr, function(memo, item, i, a) {
  return memo + item;
}, 0);
console.log(arr_sum);

var arr_even = _filter(arr, function(item, i, a) {
  return item % 2 === 0;
});

console.log(arr_even);


