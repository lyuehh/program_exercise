var array = [for (x of [0, 1, 2]) for (y of [0, 1, 2]) x + '' + y];
console.log(array);

var square = (x) => {
  return x * x;
};
var square2 = x => x * x;

console.log(square(2));
console.log(square(3));

var [a, [b], c, d] = ['hello', [', ', 'junk'], ['world']];
console.log(a);

function Tree(left, label, right) {
  this.left = left;
  this.label = label;
  this.right = right;
}
// A recursive generator that iterates the Tree labels in-order.
function* inorder(t) {
  if (t) {
    yield* inorder(t.left);
    yield t.label;
    yield* inorder(t.right);
  }
}

// Make a tree
function make(array) {
  // Leaf node:
  if (array.length == 1) return new Tree(null, array[0], null);
  return new Tree(make(array[0]), array[1], make(array[2]));
}
var tree = make([[['a'], 'b', ['c']], 'd', [['e'], 'f', ['g']]]);

// Iterate over it
var result = [];
for (var node of inorder(tree)) {
  result.push(node); // a, b, c, d, ...
}
console.log(result);

var binary = [
  0b0,
  0b1,
  0b11
];
