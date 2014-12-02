/*
function a(f) {
    return function(x) {
        return f(x);
    };
}
a(function(x) {})(0);
*/

(function(f) {
  return function(x) {
    return f(x);
  };
});

add1 = function(n) {
    return n + 1
}

add1(10)

mul3 = function(n) {
    return n * 3
}

mul3(add1(10))

make_adder = function(x) {
    return function(n) {
        return n + x
    }
}

add1 = make_adder(1)

compose = function(f, g) {
    return function(n) {
        return f(g(n));
    }
}

mul3add1 = compose(mul3, add1)

mul3add1(10)
console.log(1);

(function(f,g) {
    return function(n) {
        return f(g(n))
    }
})(function(n) {
    return n * 3
}, (function(n) {
    return function(x) {
        return n + x
    }
})(1))(10)

// ES6语法

/*
(((f,g) => {
   return (n) => f(g(n))
})((n) => n * 3,
((n) => {
   return (x) => n + x
})(1))(10))
*/

// console.log(add1(10))
// console.log(mul3add1(10));
//

ZERO = function(f) {
    return function(x) {
        return x
    }
}

ONE = function(f) {
    return function(x) {
        return f(x)
    }
}

TWO = function(f) {
    return function(x) {
        return f(f(x))
    }
}

to_integer = function(f) {
    return f(function(n) {
        return n + 1
    })(0)
}

to_integer(ZERO)

to_integer(ONE)

// console.log(to_integer(ZERO));
// console.log(to_integer(ONE));
// console.log(to_integer(TWO));


to_boolean = function(f) {
    return f(true)(false)
}

IF = function(f) {
    return function(x) {
        return function(y) {
            f(x)(y)
        }
    }
}
/*
 *
INCREMENT = -> n { -> p { -> x { p[n[p][x]] } } }
DECREMENT = -> n { -> f { -> x { n[-> g { -> h { h[g[f]] } }]
                                  [-> y { x }][-> y { y }] } } }
*/

/*
ADD      = -> m { -> n { n[INCREMENT][m] } }
SUBTRACT = -> m { -> n { n[DECREMENT][m] } }
MULTIPLY = -> m { -> n { n[ADD[m]][ZERO] } }
POWER    = -> m { -> n { n[MULTIPLY[m]][ONE] } }
*/

INCREMENT = function(n) {
    return function(f) {
        return function(x) {
            f(n(f)(x))
        }
    }
}

ADD = function(m) {
    return function(n) {
        n(INCREMENT)(m)
    }
}

// console.log(to_integer(INCREMENT(TWO)));
console.log(to_integer(INCREMENT(ONE)));

// console.log(to_boolean(TRUE));


/*

ZERO λf.λx.x

ONE λf.λx.f x

TWO λf.λx.f (f x)


TRUE λx.λy.x

FALSE λx.λy.y

λX.X


(function(x) {
    return x
})

*/

// plus ≡ λm.λn.λf.λx. m f (n f x)

// JavaScript

function f(x, y) {
    return x * x + y * y
}

f(3, 4)

function fC(x) {
    return function(y) {
        return x * x + y * y
    }
}
fC(3)(4)

function curry(f) {
    return function(x) {
        return function(y) {
            return f(x,y)
        }
    }
}

ff = curry(f)

ff(3)(4)


function uncurry(f) {
    return function(x, y) {
        return f(x)(y)
    }
}

VOID = function(x) {
    return x
}

TRUE = function(x) {
    return function(y) {
        return x
    }
}

FALSE = function(x) {
    return function(y) {
        return y
    }
}

IF = function(f) {
    return function(x) {
        return function(y) {
            return f(x)(y)
        }
    }
}

to_boolean = function(f) {
    return f(true)(false)
}

PLUS = function(n) {
    return function(m) {
        return function(f) {
            return function(z) {
                return (n(f)(m(f)(z)))
            }
        }
    }
}

SUCC = function(n) {
    return function(f) {
        return function(z) {
            return f(n(f)(z))
        }
    }
}

var [a, b, c] = [1, 2, 3]

a
b
c

var { foo, bar } = { foo: "aaa", bar: "bbb" }

foo
bar


[x, y] = [y, x]


function f() {
    return [1, 2, 3]
}
var [a, b, c] = f()


function f({x, y, z}) {
    // x, y, z
}

f({x:1, y:2, z:3})


/*
S = { 2*x | x ∈ N, x < 10 }

[2*x | x <- [1..20], x<10]

[2*x | x <- [1..20], 2*x >= 12, 2*x<=18]

x = [1..20] // coffee script

[for (i of x) if (i<10) i*2]

[for (i of x) if (2*i>12 && 2*i <=18) i*2]
*/

