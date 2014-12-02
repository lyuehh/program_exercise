// λf.λx.x
ZERO = function(f) {
    return function(x) {
        return x
    }
}

// λf.λx.f x
ONE = function(f) {
    return function(x) {
        return f(x)
    }
}

// λf.λx.f (f x)
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

console.log('ZERO: '+ to_integer(ZERO))

console.log('ONE: '+ to_integer(ONE))

// λn.λf.λz.f (n f z)
SUCC = function(n) {
    return function(f) {
        return function(z) {
            return f(n(f)(z))
        }
    }
}

console.log('SUCC(ONE): '+ to_integer(SUCC(ONE)))



// λn.λm.λf.λz.n f m(f z)
PLUS = function(n) {
    return function(m) {
        return function(f) {
            return function(z) {
                return n(f)(m(f)(z))
            }
        }
    }
}

to_integer(PLUS(ONE)(TWO))

console.log('PLUS(ONE)(TWO): '+ to_integer(PLUS(ONE)(TWO)))

// λn.λm.λf.λz.n (m f) z
MULT = function(n) {
    return function(m) {
        return function(f) {
            return function(z) {
                return n(m(f))(z)
            }
        }
    }
}
console.log('MULT(TWO)(TWO): '+ to_integer(MULT(TWO)(TWO)))

// λn.λf.λz.n (λg.λh.h (g f)) (λu.z) (λu.u)
PRED = function(n) {
    return function(f) {
        return function(z) {
            return ((n(function(g) {
                return (function(h) {
                    return h(g(f))
                })
            }))(function(u) {
                return z
            }))(function(u) {
                return u
            })
        }
    }
}

console.log('PRED(TWO): '+ to_integer(PRED(TWO)));

// λn.λm.m PRED n
SUB = function (n) {
    return function(m) {
        return (m(PRED))(n)
    }
}

to_integer(SUB(TWO)(ONE))

console.log('SUB(TWO)(ONE): '+ to_integer(SUB(TWO)(ONE)))

// λx.λy.x
TRUE = function(x) {
    return function(y) {
        return x
    }
}

// λx.λy.y
FALSE = function(x) {
    return function(y) {
        return y
    }
}

// λf.λx.λy.f x y
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

to_boolean(TRUE)
to_boolean(FALSE)

console.log('TRUE: '+ to_boolean(TRUE))
console.log('FALSE: '+ to_boolean(FALSE))

IFTRUE = IF (TRUE) (function() {
    return TRUE
}) (function() {
    return FALSE
})

console.log('IF(TRUE): ' + to_boolean(IFTRUE()))

// λf.λx.f x f
AND = function(f) {
    return function(x) {
        return f(x)(f)
    }
}

// λf.λx.f f x
OR = function(f) {
    return function(x) {
        return f(f)(x)
    }
}

// λf.λx.λy.f y x
NOT = function(f) {
    return function(x) {
        return function(y) {
            return f(y)(x)
        }
    }
}

console.log('AND(TRUE)(FALSE): ' + to_boolean(AND(TRUE)(FALSE)))
console.log('OR(TRUE)(FALSE): ' + to_boolean(OR(TRUE)(FALSE)))
console.log('NOT(TRUE): ' + to_boolean(NOT(TRUE)))
console.log('NOT(FALSE): ' + to_boolean(NOT(FALSE)))


