/* global console */
function setName(obj) {
    obj.name = "aa";
}

var p = {};
setName(p);
console.log(p.name);


function setName2(obj) {
    obj.name = "aa";
    obj = {};
    obj.name = 'bb';
}

var p = {};
setName2(p);
console.log(p.name);
