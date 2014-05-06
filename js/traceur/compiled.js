System.register("a", [], function() {
  "use strict";
  var __moduleName = "a";
  var array = (function() {
    var $__0 = 0,
        $__1 = [];
    for (var $__4 = [0, 1, 2][Symbol.iterator](),
        $__5; !($__5 = $__4.next()).done; ) {
      var x = $__5.value;
      for (var $__2 = [0, 1, 2][Symbol.iterator](),
          $__3; !($__3 = $__2.next()).done; ) {
        var y = $__3.value;
        $__1[$__0++] = x + '' + y;
      }
    }
    return $__1;
  }());
  console.log(array);
  var square = (function(x) {
    return x * x;
  });
  var square2 = (function(x) {
    return x * x;
  });
  console.log(square(2));
  console.log(square(3));
  var $__6 = ['hello', [', ', 'junk'], ['world']],
      a = $__6[0],
      b = $__6[1][0],
      c = $__6[2],
      d = $__6[3];
  console.log(a);
  function Tree(left, label, right) {
    this.left = left;
    this.label = label;
    this.right = right;
  }
  function inorder(t) {
    var $__8,
        $__9,
        $__10,
        $__11;
    return $traceurRuntime.generatorWrap(function($ctx) {
      while (true)
        switch ($ctx.state) {
          case 0:
            $ctx.state = (t) ? 11 : -2;
            break;
          case 11:
            $__8 = inorder(t.left)[Symbol.iterator]();
            $ctx.sent = void 0;
            $ctx.action = 'next';
            $ctx.state = 12;
            break;
          case 12:
            $__9 = $__8[$ctx.action]($ctx.sentIgnoreThrow);
            $ctx.state = 9;
            break;
          case 9:
            $ctx.state = ($__9.done) ? 3 : 2;
            break;
          case 3:
            $ctx.sent = $__9.value;
            $ctx.state = 10;
            break;
          case 2:
            $ctx.state = 12;
            return $__9.value;
          case 10:
            $ctx.state = 14;
            return t.label;
          case 14:
            $ctx.maybeThrow();
            $ctx.state = 16;
            break;
          case 16:
            $__10 = inorder(t.right)[Symbol.iterator]();
            $ctx.sent = void 0;
            $ctx.action = 'next';
            $ctx.state = 28;
            break;
          case 28:
            $__11 = $__10[$ctx.action]($ctx.sentIgnoreThrow);
            $ctx.state = 25;
            break;
          case 25:
            $ctx.state = ($__11.done) ? 19 : 18;
            break;
          case 19:
            $ctx.sent = $__11.value;
            $ctx.state = -2;
            break;
          case 18:
            $ctx.state = 28;
            return $__11.value;
          default:
            return $ctx.end();
        }
    }, this);
  }
  function make(array) {
    if (array.length == 1)
      return new Tree(null, array[0], null);
    return new Tree(make(array[0]), array[1], make(array[2]));
  }
  var tree = make([[['a'], 'b', ['c']], 'd', [['e'], 'f', ['g']]]);
  var result = [];
  for (var $__2 = inorder(tree)[Symbol.iterator](),
      $__3; !($__3 = $__2.next()).done; ) {
    var node = $__3.value;
    {
      result.push(node);
    }
  }
  console.log(result);
  var binary = [0, 1, 3];
  return {};
});
System.get("a" + '');
