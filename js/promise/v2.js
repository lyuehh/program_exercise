var Promise = function () {  this.thens = []  };
Promise.prototype = {
    resolve: function () {
        var r, f, t, i, u, e, n;
        if (this.promiseArr) {
            for (n = 0, i = this.promiseArr.length; n < i; n++) this.promiseArr[n].resolveCount++;
                if (this.resolveCount !== this.promiseArr.length) return;
        }
        while (r = this.thens.shift())
            if (r.length) {
                for (t = [], n = 0, i = r.length; n < i; n++)
                    u = r[n].apply(null, arguments),
                u instanceof Promise && (u.thens = this.thens, t.push(u));
                if (e = t.length, e === 0) continue;
                else {
                    for (n = 0; n < e; n++) t[n].promiseArr = t,
                        t[n].resolveCount = 0;
                    break;
                }
            }
            else {
                if (f = r.apply(null, arguments), f instanceof Promise) {
                    f.thens = this.thens;
                    break;
                }
                continue;
            }
        },
        then: function (n) { return this.thens.push(n), this;  },
        when: function () { return this.thens.push(arguments), this;  }
    }

/*
1.防止了中途掉链子的情况（task返回的不是promise对象）
2.增加了when方法
 */