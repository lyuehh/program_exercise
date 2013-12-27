var a = 1;
function b(){
    a = 2;
    console.log(a);
    a = 3;
    setTimeout(function(){
        console.log(a);
    }, 0);
    a = 4;
}
b();
console.log(0);
/*
2
0
4
*/
