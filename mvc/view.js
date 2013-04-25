var addChange = function(ob) {
    ob.change = function(callback) {
        if (callback) {
            if(!this._change) this._change = [];
            this._change.push(callback);
        } else {
            if(!this._change) return;
            for (var i = 0, j = this._change.length; i < j; i++) {
                this._change[i].apply(this);
            }
        }
    };
};

var object = {};
object.name = "foo";
addChange(object);
object.change(function() {
    console.log("changeed!",this);
});

object.change();

object.name = "Bar";
object.change();
