function removeDuplicate (s) {
    if(!str) {return;}
    if(str.length < 2) {return;}

    var str = s.split('');

    var tail = 1;
    for(var i=1;i<str.length;i++) {
        var j;
        for(j=0;i<tail;j++) {
            if(str[i] === str[j]) {
                break;
            }
        }
        if(j === tail) {
            str[tail] = str[i];
            ++tail;
        }
    }
    if(tail < s.length) {
        str[tail] = 0;
    }
    return arrToString(str);
}

function arrToString(arr) {
    return arr.join('').split('0')[0];
}