/* global console */

var num = 0;
outer:
    for (var i = 0, l = 10; i < l; i ++) {
        for (var j = 0, ll = 10; j < ll; j ++) {
            if (i === 5 && j === 5) {
                break outer;
            }
            num++;
        }
    }
console.log(num);

/*
i: 0,1,2,3,4
 *
i: 0,1,2,3,4,5,6,7,8,9
  = 50次
i: 5
J: 0,1,2,3,4
 = 5次
 50 + 5 = 55次
*/
