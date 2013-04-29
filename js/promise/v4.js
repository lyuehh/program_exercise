var Promise = function () {
    this.thens = [];
};
Promise.prototype = {
    resolve: function () {
        if (this.promiseArr) {
            if (this.promiseArr[0].action !== "any") {
                for (var i = 0, j = this.promiseArr.length; i < j; i++) {
                    this.promiseArr[i].resolveCount++;
                }
                if (this.resolveCount !== this.promiseArr.length) {
                    return;
                }
            }
        }
        
        var t, n;
        while (t = this.thens.shift()) {
            var doneFn = t.done, action = t.action;
            if (doneFn.length) {
                var arr = [];
                for (var i = 0, j = doneFn.length; i < j; i++) {
                    var m = doneFn[i].apply(null, arguments);
                    if (m instanceof Promise) {
                        m.thens = this.thens;
                        arr.push(m);
                    }
                }
                
                var l = arr.length;
                if (l === 0) {
                    continue;
                } else {
                    for (var i = 0; i < l; i++) {
                        arr[i].promiseArr = arr;
                        arr[i].action = action;
                        arr[i].resolveCount = 0;
                    }
                    break;
                }
            } else {
                n = doneFn.apply(null, arguments);
                if (n instanceof Promise) {
                    n.thens = this.thens;
                    break;
                }
                continue;
            }
        }
    },
    
    reject: function () {
        if (this.promiseArr && this.promiseArr[0].action === "any") {
            if (this.promiseArr[this.promiseArr.length - 1] !== this) {
                return;
            }
        }
        var t;
        while (t = this.thens.shift()) {
            if (t.fail) t.fail.apply(null, arguments);
            break;
        }
    },
    
    then: function (done, fail) {
        this.thens.push({ done: done, fail: fail, action: "then" });
        return this;
    },
    
    any: function (done, fail) {
        this.thens.push({ done: done, fail: fail, action: "any" });
        return this;
    }
}