var Promise = function () {
    this.thens = []
};
Promise.prototype = {
    resolve: function () {
        this._handle("done", arguments)
    },
    reject: function () {
        this._handle("fail", arguments)
    },
    _handle: function (n, t) {
        var o, s, f, h, r, u, e, c, i;
        if (this.promiseArr) {
            for (i = 0, u = this.promiseArr.length; i < u; i++) this.promiseArr[i].resolveCount++;
                if (this.resolveCount !== this.promiseArr.length && n === "done") return;
        }
        while (o = this.thens.shift()) {
            if (f = o.done, h = o.fail, n === "fail") {
                h && h.apply(null, t); break;
            }
            if (f.length) {
                for (r = [], i = 0, u = f.length; i < u; i++) e = f[i].apply(null, t), e instanceof Promise && (e.thens = this.thens, r.push(e));
                    if (c = r.length, c === 0) continue;
                else {
                    for (i = 0; i < c; i++) r[i].promiseArr = r, r[i].resolveCount = 0;
                        break;
                }
            } else {
                if (s = f.apply(null, t), s instanceof Promise) {
                    s.thens = this.thens; break;
                }
                continue;
            }
        }
    },
    then: function (n, t) {
        this.thens.push({ done: n, fail: t });
        return this;
    }
}

/*
去除了when方法，统一使用then,用then的第一个参数类型区分是单task还是多task
增加reject方法，处理task失败
 */