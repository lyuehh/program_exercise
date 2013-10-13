function binsearch(arr,x) {
  var high = arr.length - 1;
  var low = 0;
  while(low <= high) {
    var mid = parseInt((high+low)/2, 10);
    if(x > arr[mid]) {
      low = mid + 1;
    } else if(x < arr[mid]) {
      high = mid - 1;
    } else {
      return mid;
    }
  }
  return -1;
}

function binsearch2(arr, x) {
  var high = arr.length - 1;
  var low = 0;
  var mid = parseInt((high+low)/2, 10);
  while(low <= high && x !== arr[mid]) {
    if(x < arr[mid]) {
      high = mid - 1;
    } else {
      low = mid + 1;
    }
    mid = parseInt((high+low)/2, 10);
  }
  if(x === arr[mid]) {
    return mid;
  } else {
    return -1;
  }
}

exports.binsearch = binsearch;
exports.binsearch2 = binsearch2;
