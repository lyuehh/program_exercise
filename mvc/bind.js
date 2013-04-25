var User = function(name) {
    this.name = name;
};
User.records = [];
User.bind = function(ev,callback) {
    var calls = this._callbacks || (this._callbacks = {});
    (this._callbacks[ev] || (this._callbacks[ev] = [])).push(callback);
};
User.trigger = function(ev) {
    var list,calls,i,l;
    if(!(calls = this._callbacks)) return this;
    if(!(list = this._callbacks[ev])) return this;
    jQuery.each(list,function() {this()})
};
User.create = function(name) {
    this.records.push(new this(name));
    this.trigger("change");
};
$(function($) {
    User.bind("change",function() {
        var template = $("#userTmpl").tmpl(User.records);
        $("#users").empty();
        $("#users").append(template);
    });

    User.create("First one");
    setTimeout(function() {
        User.create('another one');
    },2000);
})
