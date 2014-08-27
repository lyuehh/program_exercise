// on off
(function($) {
  var o = $({});
  $.on = function() {
    o.on.apply(o, arguments);
  };

  $.off = function() {
    o.off.apply(o, arguments);
  };

  $.trigger = function() {
    o.trigger.apply(o, arguments);
  };

}(jQuery));

// the component
function Tree(el, name) {
    this.el = null;
    this.name = null;
}

Tree.prototype.init = function(el, name) {
    var self = this;
    this.el = $(el);
    this.name = name;
    this.el.html('<button class="b1">'+ this.name +'</button>');
    this.el.find('button').on('click', function(e) {
        self.trigger('click', e);
    });
}

Tree.prototype.on = function(ev, handler) {
    $.on(ev, handler);
}

Tree.prototype.off = function(ev) {
    $.off(ev);
}

Tree.prototype.trigger = function(ev, data) {
    $.trigger(ev, data);
}

$(function() {

    // how to use
    var tree = new Tree();
    tree.init('.here', 'tree1');
    tree.on('click', function(e) {
        alert('you click it');
        tree.off(); // 取消订阅， 再次点击后就无效了
    });
});
