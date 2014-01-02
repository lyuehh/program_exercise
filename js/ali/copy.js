
function copy(obj) {
    if (typeof obj !== 'object') {
        return;
    }
    var ret = obj.constructor === Object ? {} : [];
    for (var i in obj) {
        if (obj[i].constructor === Array) {
            ret[i] = Array.prototype.slice.call(obj[i]);
        } else if (obj[i].constructor === Object) {
            ret[i] = copy(obj[i]);
        } else {
            ret[i] = obj[i];
        }
    }
    return ret;
}

var a = {
    "name": "aa",
    "job": {
        "a": "b",
        "c": "d"
    },
    "haha": [1,2,3]
};
console.log(a);
var b = copy(a);
console.log(b);
a.d = "d";
a.haha.push('11');
console.log(a);
console.log(b);

var b = [1,2,3];
console.log(b);
console.log(copy(b));

var c = [{"a":"1"}, {"b":"2"}];
console.log(c);
console.log(copy(c));
