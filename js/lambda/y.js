// 1

var fact = function(n) {
    if (n < 2) {
        return 1
    } else {
        return n * fact(n - 1)
    }
}

fact(5)

// fact = F(fact)

console.log('1:' +fact(5));

// 1.5

(function(n) {
    if (n < 2) {
        return 1
    } else {
        return n * arguments.callee(n - 1)
    }
})(5)

;

f(fact) = fact


//fact 是一个普通函数

fact(Y(fact)) = Y(fact)


(function(f) {
    f(f);
})(function(f) {
    f(f);
})


// 2
var fact2 = (function(f) {
    return function(n) {
        if (n < 2) {
            return 1
        } else {
            return n * f(f)(n - 1)
        }
    }
})(function(f) {
    return function(n) {
        if (n < 2) {
            return 1
        } else {
            return n * f(f)(n - 1)
        }
    }
})

console.log('2:' +fact2(5));

// 3

var recur = function(f) {
    return f(f)
}

var fact3 = recur(function(f) {
    return function(n) {
        if (n < 2) {
            return 1
        } else {
            return n * f(f)(n - 1)
        }
    }
})

console.log('3:' +fact3(5));

// 4

var recur = function(f) {
    return f(f)
}

var fact4 = recur(function(f) {
    var g = function(n) {
        return f(f)(n)
    }

    return function(n) {
        if (n < 2) {
            return 1
        } else {
            return n * g(n - 1)
        }
    }
})

console.log('4:' +fact4(5));

// 5

var recur = function(f) {
    return f(f)
}

var wrap = function(h) {
    return recur(function(f) {
        var g = function(n) {
            return f(f)(n)
        }
        return h(g)
    })
}

var fact5 = wrap(function(g) {
    return function(n) {
        if (n < 2) {
            return 1
        } else {
            return n * g(n - 1)
        }
    }
})

console.log('5:' +fact4(5));
// 6

var recur = function(f) {
    return f(f)
}

var wrap = function(h) {
    return recur(function(f) {
        return h(function(n) {
            return f(f)(n)
        })
    })
}

var fact6 = wrap(function(g) {
    return function(n) {
        if (n < 2) {
            return 1
        } else {
            return n * g(n - 1)
        }
    }
})

console.log('6:' +fact4(5));

// 7

var wrap = function(h) {
    return (function(f) {
        return f(f)
    })(function(f) {
        return h(function(n) {
            return f(f)(n)
        })
    })
}

var fact7 = wrap(function(g) {
    return function(n) {
        if (n < 2) {
            return 1
        } else {
            return n * g(n - 1)
        }
    }
})

console.log('7:' +fact4(5));

// 8

Y = function(h) {
    return (function(f) {
        return f(f)
    })(function(f) {
        return h(function(n) {
            return f(f)(n)
        })
    })
}

(function(h) {
    return (function(f) {
        return f(f)
    })(function(f) {
        return h(function(n) {
            return f(f)(n)
        })
    })
})(function(g) {
    return function(n) {
        if (n < 2) {
            return 1
        } else {
            return n * g(n - 1)
        }
    }
})(5)

// Y = λf.(λx.f(x x))(λx.f(x x))


(function(h) {
    return (function(f) {
        return f(f)
    })(function(f) {
        return h(function(n) {
            return f(f)(n)
        })
    })
})(function() {
    console.log('Thanks');
})

JavaScript
CoffeeScript / TypeScript
Dart

C    // no, 编译器部分支持
C++  // C++11
C#   // 3.0
Java // 8
Go
Swift

Clojure
Scala
Groovy

Perl
Python
Ruby
Lua

Lisp
Scheme
Haskell
OCaml
Racket



