//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 类型转换
// 类型转换 可以判断实例的类型，也可以将实例看做是父类或者子类的实例
// 类型转换在swift中使用is和as操作符实现。这两个操作符提供了一种简单的方式检查值的类型或者转换它的类型

// 定义一个类层次作为例子
// 将类型转换用在类和子类的层次结构上，检查特定类实例的类型并且转换这个类实例的类型成为这个层次结构中的其他类型

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director:String
    init(name:String, dirent:String) {
        self.director = dirent
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name:String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", dirent: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", dirent: "Orson Welles"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")

]

// 检查类型
// 用类型检查操作符is来检查一个实例是否属于特定子类型。若实例属于那个子类型，类型检查操作符返回true,否则返回false
var movieCount = 0
var songCount = 0
for item in library {
    if item is Movie {
        ++movieCount
    }else if item is Song {
        ++songCount
    }
}


// 向下转型
// 某类型的一个常量或变量可能在幕后实际上属于一个子类。当确定是这种情况时，可以尝试向下转到它的子类型，用类型转换操作符as?或as!
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir:\(movie.director)")
    } else if let song = item as? Song {
        print("Song:\(song.name), by:\(song.artist)")
    }
}

// Any 和AnyObject的类型转换
// swift为不确定类型提供了两种特殊类型别名
// AnyObject 可以代表任何class类型的实例
// Any 可以表示任何类型，包括方法类型

// AnyObject类型
// 当使用Cocoa APIs,我们一般会接收一个[AnyObject]类型的数组，或者说“一个任何对象类型的数组”。
let someObjects:[AnyObject] = [
    Movie(name: "2001: A Space Odyssey", dirent: "Stanley Kubrick"),
    Movie(name: "Moon", dirent: "Duncan Jones"),
    Movie(name: "Alien", dirent: "Ridley Scott")
]
for object in someObjects {
    let movie = object as! Movie
    print("\(movie.name),\(movie.director)")
}

for movie in someObjects as! [Movie] {
    print("Movie: \(movie.name),dir:\(movie.director)")
}

//Any 类型

var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0,5.0))
things.append(Movie(name: "Ghostbusters", dirent: "Ivan Reitman"))
things.append({(name:String) -> String in "hello, \(name)"})

for thing in things {
    switch thing {
    case 0 as Int:
        print("Zero as an Int")
    case 0 as Double:
        print("Zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x,y) as (Double,Double):
        print("an (x,y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name),dir: \(movie.director)")
    case let stringConverter as String -> String:
        print("stringConverter(Michael)")
    default:
        print("something else")
    }
}


// 嵌套类型
// swift允许定义嵌套类型，可以在枚举类型、类和结构体中定义支持嵌套的类型
// 要在一个类型中嵌套另一个类型，将需要嵌套的类型的定义写在被嵌套类型的区域{}内，而且可以根据需要定义多级嵌套

// 嵌套类型实例
struct BlackjackCard {
//    嵌套定义枚举类型suit
    enum Suit:Character {
        case Spades = "?"
        case Hearts = "!"
        case Diamonds = "~"
        case Clubs = "&"
    }
    
//    嵌套定义枚举Bank
    enum Rank:Int {
        case Two = 2,There,Four,Five,Six,Seven,Eight,Nine,Ten
        case Jack,Queen,King,Ace
        struct Value {
            let first:Int, second:Int?
        }
        var values:Value {
            switch self {
            case .Ace:
                return Value(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Value(first: 10, second: nil)
            default:
                return Value(first: self.rawValue, second: nil)
            }
        }
    }
    let rank:Rank, suit:Suit
    var description:String {
        var output = "suit is \(suit.rawValue)"
        output += "value is \(rank.values.first)"
        if let second = rank.values.second {
            output += "or \(second)"
        }
        return output
    }
}

let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)
print("theAceOfSpades:\(theAceOfSpades.description)")

// 嵌套类型的引用
// 在外部对嵌套类型的引用，以被嵌套类型的名字为前缀，加上所要引用的属性名
let heartsSymbol = BlackjackCard.Suit.Hearts.rawValue


// 扩展(Extension)
// 扩展可以向已有类型添加计算型实例属性和计算型类型属性。
extension Double {
    var km: Double {
        return self * 10000.0
    }
    var m: Double {
        return self
    }
    var cm: Double {
        return self / 100.0
    }
    var mm: Double {
        return self / 10000.0
    }
    var ft: Double {
        return self / 3.28084
    }
}

let oneInch = 25.4.mm
let threeFeet = 3.ft

// 扩展可以添加新的计算属性，但是不可以添加存储属性，也不可以向已有属性添加属性观测器



// 构造器
// 扩展可以向已有类型添加新的构造器。这可以让你扩展其它类型，将你自己的定制类型作为构造器参数，或者提供该类型的原始实现中没有包含的额外初始化选项。
// 扩展能向类中添加新的便利构造器，但是它们不能向类中添加新的指定构造器或析构器。指定构造器和析构器必须总是由原始的类实现来提供。
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

// 提供一个额外的使用特殊中心点和大小的构造器来扩展Rect结构体
extension Rect {
    init(center:Point, size:Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin:Point(x: originX, y: originY),size:size)
    }
}
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

// 方法
// 扩展可以向已有类型添加新的实例方法和类型方法。
extension Int {
    func repetitions(task:() -> ()) {
        for i in 0..<self {
            task()
        }
    }
}
3.repetitions({
    print("hello!")
})

// 可变实例方法
// 通过扩展添加的实例方法也可以修改该实例本身。结构体和枚举中修改self或其属性的方法必须将该实例方法标注为mutating
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()

// 下标
// 扩展可以向一个已有类型添加新下标。
extension Int {
    subscript(var digiIndex:Int) -> Int{
        var decimalBase = 1
        while digiIndex > 0 {
            decimalBase *= 10
            --digiIndex
        }
        return (self / decimalBase)
    }
}
7485285652[0]
print("\(77478484784[1])")

// 嵌套类型
// 扩展可以向已有的类、结构体和枚举添加新的嵌套类型
extension Int {
    enum Kind {
        case Negative,Zero,Positive
    }
    var kind:Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0 :
            return .Positive
        default:
            return .Negative
        }
    }
}

func printIntegerKinds(numbers:[Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("-")
        case .Zero:
            print("0")
        case .Positive:
            print("+")
        }
    }
    print("")
}
printIntegerKinds([3,15,-27,0,-6,0,8])




















