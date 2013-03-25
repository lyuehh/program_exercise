function binsearch(arr,x) {
  var high = arr.length - 1;
  var low = 0;
  while(low <= high) {
    var mid1 = Math.floor((high+low)/2);
    var mid = parseInt((high+low)/2, 10);
    console.log('');
    console.log('1: ' + mid1);
    console.log('2: ' + mid);
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

exports.binsearch = binsearch;
