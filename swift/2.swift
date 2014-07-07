func fibonaci(n: Int) -> Double {
    return n < 2 ? Double(n) : fibonaci(n - 1) + fibonaci(n - 2)
}

//let phi = fibonaci(45) / fibonaci(44)
//println(phi)


var fibonacciMemo = Dictionary<Int, Double>()

func fib(n: Int) -> Double {
    if let result = fibonacciMemo[n] {
        return result
    }
    let result = n < 2 ? Double(n): fib(n - 1) + fib(n - 2)
    fibonacciMemo[n] = result
    return result
}

let phi = fib(45) / fib(44)
println(phi)


let fib2: (Int) -> Double = memoize {
    fib2, n in
    n < 2 ? Double(n): fib(n - 1) + fib(n - 2)
}

func memoize<T: Hashable, U>(body: (T) -> U) -> (T) -> U {
    var memo = Dictionary<T, U>()
        return  { x in
            if let q = memo[x] { return q }
            let r = body(x)
            memo[x] = r
            return r
        }
}

var factorial: (int) -> Int = { $0 }
factorial = memorize {x in x == 0 ? 1 : x * factorial(x - 1)}


