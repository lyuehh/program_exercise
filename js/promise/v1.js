var Promise = function () {
    this.thens = [];
};
Promise.prototype = {
    resolve: function () {
        var t = this.thens.shift(), n;
        t && (n = t.apply(null, arguments), n instanceof Promise && (n.thens = this.thens));
    },
    then: function (n) {
        return this.thens.push(n), this;
    }
}