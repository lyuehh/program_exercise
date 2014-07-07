let a = [70, 40, 100, 80, 12]
var sc = 0
for s in a {
    if s > 50  {
        sc += 3
    } else {
        sc += 1
    }
}
println(sc)
println("123")

var optionalString: String? = "hello"
optionalString == nil

var optionalName: String? = "123"
var g = "hello"
if let name = optionalName {
    g = "hello \(name)"
}
println(g)




let vegetable = "red pepper"

switch vegetable {
    case "celery":
        let vC = "add xxx"
    case "cucumber", "watercress":
        let vC = "that was good"
    case let x where x.hasSuffix("pepper"):
        let vC = "Is it a \(x)"
    default:
        let vC = "good"
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
println(largest)

var n = 2
while n < 100 {
    n = n * 2
}


var m = 2
do {
    m = m * 2
} while m < 100



var firstLoop = 0
for i in 0..3 {
    firstLoop += 1
}


var secondLoop = 0
for var i=0; i<3; ++i {
    secondLoop += 1
}


func greet(name: String, day: String) -> String {
    return "hello \(name), today is \(day)."
}

greet("bob", "Tuesday")


func getGasPrices() -> (Double, Double, Double) {
    return (1.2, 1.3, 1.4)
}
getGasPrices()


func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for n in numbers {
        sum += n
    }
    return sum
}

sumOf()
sumOf(42, 43, 44)


func return15() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

return15()

func makeInc() -> (Int -> Int) {
    func add1(number: Int) -> Int {
        return 1 + number
    }
    return add1
}
var inc = makeInc()
println(inc(1))


func hasAnyMatches(list: Int[], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen)

numbers.map({
    (n: Int) -> Int in
    let result = 3 * n
    return result
})

numbers.map({number in 3 * number})

sort([1,5,3,2,4]) { $0 > $1 }

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "a shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDesc = shape.simpleDescription()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "a shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape{
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sideof length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "test square")
println(test.area())
println(test.simpleDescription())

class Circle: NamedShape {
    var radius: Double

    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 1
    }

    func area() -> Double {
        return radius * radius * 3.1415926
    }

    override func simpleDescription() -> String {
        return "A circle with radius \(radius)"
    }
}

let c1 = Circle(radius:  5, name: "circle 1")
println(c1.area())
println(c1.simpleDescription())

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
             return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
println(triangle.perimeter)
triangle.perimeter = 9.9
println(triangle.sideLength)

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
println(triangleAndSquare.square.sideLength)
println(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
println(triangleAndSquare.triangle.sideLength)


class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int) {
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)
println(counter.count)

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
            case .Ace:
                return "ace"
            case .Jack:
                return "jack"
            case .Queen:
                return "queen"
            case .King:
                return "king"
            default:
                return String(self.toRaw())
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.toRaw()

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
            case .Spades:
                return "spades"
            case .Hearts:
                return "hearts"
            case .Diamonds:
                return "diamonds"
            case .Clubs:
                return "clubs"
        }
    }
    func color() -> String {
        switch self {
            case .Spades, .Clubs:
                return "black"
            case .Diamonds, .Hearts:
                return "red"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
println(heartsDescription)
println(hearts.color())

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
    case let .Result(sunrise, sunset):
        let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
    case let .Error(error):
        let serverResponse = "Failure...  \(error)"
}

protocol ExampleProtocol {
     var simpleDescription: String { get }
     mutating func adjust()
}

class SimpleClass: ExampleProtocol {
     var simpleDescription: String = "A very simple class."
     var anotherProperty: Int = 69105
     func adjust() {
          simpleDescription += "  Now 100% adjusted."
     }
}
var aa = SimpleClass()
aa.adjust()
let aDescription = aa.simpleDescription

struct SimpleStructure: ExampleProtocol {
     var simpleDescription: String = "A simple structure"
     mutating func adjust() {
          simpleDescription += " (adjusted)"
     }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

/*
enum SimpleEnum: ExampleProtocol {
    case simpleDescription: String
    func adjust() {
        simpleDescription += " adjusted by enum."
    }
}
*/

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
 }
7.simpleDescription

func repeat<ItemType>(item: ItemType, times: Int) -> ItemType[] {
    var result = ItemType[]()
    for i in 0..times {
         result += item
    }
    return result
}
repeat("knock", 4)

// Reimplement the Swift standard library's optional type
enum OptionalValue<T> {
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

func anyCommonElements <T, U where T: Sequence, U: Sequence, T.GeneratorType.Element: Equatable, T.GeneratorType.Element == U.GeneratorType.Element> (lhs: T, rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
   return false
}
anyCommonElements([1, 2, 3], [3])

var `class` = 123
println(`class`)

let cat = "🐱";
println(cat)

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
println(statusCode)
println(http404Error.1)

let http200Status = (code: 200, desc: "ok")
println(http200Status.code)

let age = 3
assert(age >= 3, "A person's age cannot be less than zero")

let sparklingHeart = "\U0001F496"
println(sparklingHeart)

for c in "ABC" {
    println(c)
}

func choose(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1}
    func stepBackward(input: Int) -> Int { return input - 1}
    return backwards ? stepBackward : stepForward
}

var currentValue = 4
let moveNearToZero = choose(currentValue > 0)
while currentValue != 0 {
    println("\(currentValue)...")
    currentValue = moveNearToZero(currentValue)
}
println("zero!")
