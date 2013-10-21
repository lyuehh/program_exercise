/* global console */

var num = 0;
outer:
    for (var i = 0, l = 10; i < l; i ++) {
        for (var j = 0, l = 10; j < l; j ++) {
            if (i === 5 && j === 5) {
                continue outer;
            }
            num++;
        }
    }
console.log(num);

/*
continue后，退出内部循环，执行外部循环
少执行的几次是当
i: 5
j: 5,6,7,8,9
共执行 10 * 10 - 5 = 95次
*/
