(function (window) {
    var Promise = function () {
        this.thens = [];
    };
    Promise.prototype = {
        resolve: function () {
            if (this.promiseArr) {
                for (var i = 0, j = this.promiseArr.length; i < j; i++) {
                    this.promiseArr[i].resolveCount++;
                }
                if (this.promiseArr[0].action !== "any") {
                    if (this.resolveCount !== this.promiseArr.length) {
                        return;
                    }
                } else {
                    if (this.resolveCount > 1) {
                        return;
                    }
                }
            }

            var t, n;
            while (t = this.thens.shift()) {
                var doneFn = t.done, action = t.action;
                if (t.alwaysCB && !doneFn) {
                    n = t.alwaysCB.apply(null, arguments);
                    if (n instanceof Promise) {
                        n.thens = this.thens;
                        break;
                    }
                    continue;
                }
                if (doneFn.length > 0) {
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
            var t, n;
            while (t = this.thens.shift()) {
                if (t.fail) {
                    n = t.fail.apply(null, arguments);
                    if (n instanceof Promise) {
                        n.thens = this.thens;
                        break;
                    }
                    continue;
                } else {
                    if (t.alwaysCB) {
                        n = t.alwaysCB.apply(null, arguments);
                        if (n instanceof Promise) {
                            n.thens = this.thens;
                            break;
                        }
                        continue;
                    }
                }
                break;
            }
        },

        notify: function () {
            var t = this.thens[0];
            t.progress.apply(null, arguments);
        },

        then: function (done, fail, progress) {
            this.thens.push({ done: done, fail: fail, progress: progress });
            return this;
        },

        any: function (done, fail, progress) {
            this.thens.push({ done: done, fail: fail, progress: progress, action: "any" });
            return this;
        },

        done: function (done) {
            if (this.thens.length === 0 || this.thens[this.thens.length - 1].done || this.thens[this.thens.length - 1].alwaysCB) {
                this.thens.push({ done: done });
            } else {
                this.thens[this.thens.length - 1].done = done;
            }
            return this;
        },

        fail: function (fail) {
            if (this.thens.length === 0 || this.thens[this.thens.length - 1].fail || this.thens[this.thens.length - 1].alwaysCB) {
                this.thens.push({ fail: fail });
            } else {
                this.thens[this.thens.length - 1].fail = fail;
            }
            return this;
        },

        progress: function (progress) {
            if (this.thens.length === 0 || this.thens[this.thens.length - 1].progress) {
                this.thens.push({ progress: progress });
            } else {
                this.thens[this.thens.length - 1].progress = progress;
            }
            return this;
        },

        always: function (alwaysCB) {
            if (this.thens.length === 0 || this.thens[this.thens.length - 1].alwaysCB || this.thens[this.thens.length - 1].done || this.thens[this.thens.length - 1].fail) {
                this.thens.push({ alwaysCB: alwaysCB });
            } else {
                this.thens[this.thens.length - 1].alwaysCB = alwaysCB;
            }
            return this;
        }

    }


    window.Promise = function (prmsFn) {


        if (prmsFn) {
            if (prmsFn === true) {
                var prms = new Promise();

                setTimeout(function () {
                    prms.resolve();
                }, 1)

                return prms;
            } else {
                var prms = prmsFn();
                if (prms instanceof Promise) return prms;
            }
        }
        return new Promise();

    };

}(window));

/*
新增notify方法
新增progress方法
新增Promise()自动new、自动resolve、自动构造promise
*/