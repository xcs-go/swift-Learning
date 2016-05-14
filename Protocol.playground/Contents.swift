//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 协议
// 协议规定了用来实现某一特定工作或者功能所必需的方法和属性。类，结构体或枚举类型都可以遵循协议，并提供具体实现来完成协议定义的方法和功能。

// 协议的语法
//protocol SomeProtocol {
////     协议内容
//}

// 某个类遵循某个协议，需要在类型名称后加上协议名称，中间以：分隔，作为类型定义的一部分。遵循多个协议时，各协议之间用，分隔
//struct SomeStructure:FistProtocol,AnotherProtocol {
////    结构体内容
//}


// 如果类在遵循协议的同时拥有父类，应该将父类名称放在协议名前，以，分隔
//class SomeClass:SomeSuperClass,FirstProtocol,AnotherProtocol {
////    类的内容
//}

// 对属性的规定
// 协议可以规定其遵循者提供特定名称和类型的实例属性或类属性，而不用指定是存储属性还是计算型属性。此外还必须指明是只读的还是可读可写的。

// 协议中的通常用var来声明变量属性，在类声明后加上{set get}来表示属性是可读可写的，只读属性则用{get}来表示

//protocol SomeProtocol {
//    var mustBeSettable :Int { get set }
//    var doesNotNeedToBeSettable: Int { get }
//}

// 在协议中定义类属性时，总是使用static关键字作为前缀。当协议的遵循者是类时，可以使用class或关键字来声明类属性
//protocol AnotherProtocol {
//    static var someTypeProperty: Int { get set }
//}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Appleseed")
//struct Person: FullyNamed {
//    var fullName: String = "john"
//}
//let john = Person()

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)


// 对方法的规定
// 协议可以要求其遵循者实现某些指定的实例或类方法。这些方法作为协议的一部分，像普通的方法一样放在协议的定义中，但是不需要大括号和方法体。可以在协议中定义具有可变参数的方法，和普通方法的定义方式相同。但是在协议的方法定义中，不支持参数默认值。

// 在协议中定义类方法的时候，总是使用static关键字作为前缀。当协议的遵循者是类的时候，可以在类的实例中使用class或者static来实现类方法

//protocol SomeProtocol {
//    static func someTypeMethod()
//}

protocol RandomNumberGenerator {
    func random() -> Double
}


class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
    
}
let generator = LinearCongruentialGenerator()
print(generator.random())

print(generator.random())

// 对mutating方法的规定
// 如果在协议中定义了一个方法旨在改变遵循改协议的实例，那么在协议定义时需要在方法前加mutating关键字。
// 用类实现协议中的mutating方法时，不用写mutating关键字，用结构体，枚举实现协议中的mutating方法时，必须写mutating关键字
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case Off
    case On
    mutating func toggle() {
        switch self {
        case Off:
            self = On
        case On:
            self = Off
        }
    }
}
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()

// 对构造器的规定
// 协议可以要求它的遵循者实现指定的构造器。在协议的定义里写下构造器的声明，但不需要写花括号和构造器的实体
protocol SomeProtocol {
    init(someParamenter: Int)
}

// 协议构造器规定在类中的实现
// 在遵循协议的类中实现构造器，并制定其为类的指定构造器或者便利构造器。在这两种情况下，都必须给构造器实现标上"required"修饰符
//class SomeClass:SomeProtocol {
//    required init(someParamenter: Int) {
////         构造器实现
//    }
//}

// 如果一个子类重写了父类的指定构造器，并且该构造器遵循了某个协议的规定，那么该构造器的实现需要被同时标记required和override修饰符

protocol SomesProtocol {
    init()
}
class SomeSuperClass {
    init(){
//         构造器的实现
    }
}
class  SomeSubClass:SomeSuperClass,SomesProtocol {
//    因为遵循协议，需要加上required,继承自父类，需要加上override
    required override init() {
//        实现
    }
}

// 协议类型
// 虽然协议并没有实现任何的功能，但是协议可以被当作类型来使用
// 协议可以作为：函数、方法或构造器中的参数类型或返回值类型；作为常量、变量或属性的类型；作为数组、字典或其他容器中的元素类型
class Dice {
    let sides:Int
    let generator:RandomNumberGenerator
    init(sides:Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())

for _ in 1...5{
    print(d6.roll())
}

// 代理模式
//protocol DiceGame {
//    var dice: Dice { get }
//    func play()
//}
//
//protocol DiceGameDelegate {
//    func gameDidStart(game:DiceGame)
//    func game(game:DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
//    func gameDidEnd(game:DiceGame)
//}
//
//class SnakesAndLadders: DiceGame {
//    let finalSquare = 25
//    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
//    var square = 0
//    var board:[Int]
//    init() {
//        board = [Int](count: finalSquare + 1, repeatedValue: 0)
//        board[03] = +08;
//        board[06] = +11;
//        board[09] = +09;
//        board[10] = +02;
//        board[14] = -10;
//        board[19] = -11;
//        board[22] = -02;
//        board[24] = -08
//    }
//    var delegate: DiceGameDelegate?
//    func play() {
//        square = 0
//        delegate?.gameDidStart(self)
//        gameLoop:while square != finalSquare {
//            let diceRoll = dice.roll()
//         delegate?.game(self,didStartNewTurnWithDiceRoll: diceRoll)
//            switch square + diceRoll {
//            case finalSquare:
//                break gameLoop
//            case let newSquare where newSquare > finalSquare:
//                continue gameLoop
//            default: square += diceRoll
//            square += board[square]
//            }
//
//        }
//        delegate?.gameDidEnd(self)
//    }
//}
//
//class DiceGameTracker: DiceGameDelegate {
//    var numberOfTurns = 0
//    func gameDidStart(game: DiceGame) {
//        numberOfTurns = 0
//        if game is SnakesAndLadders {
//            print("Started a new game of Snakes and Ladders") } print("The game is using a \(game.dice.sides)-sided dice")
//    }
//    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
//    { ++numberOfTurns print("Rolled a \(diceRoll)")
//    }
//    func gameDidEnd(game: DiceGame) {
//        print("The game lasted for \(numberOfTurns) turns")
//    }
//
//}
//let tracker = DiceGameTracker()
//let game = SnakesAndLadders()
//game.delegate = tracker
//game.play()
//print("idrffh")

protocol TextRepresentable {
    var textualDescription:String { get }
}
extension Dice:TextRepresentable {
    var textualDescription: String {
        return "frhdfu"
    }
}
let dl2 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(dl2.textualDescription)


// 当一个类型已经实现了协议中的所有要求，却没有声明为遵循该协议时，可以通过扩展来补充协议声明
struct Hamster {
    var name: String
    var textualDescription: String {
        return "ikrfifii"
    }
}
extension Hamster:TextRepresentable {}
let simon = Hamster(name: "Simon")
let sujd: TextRepresentable = simon
sujd.textualDescription
sujd.textualDescription

// 协议类型的集合
// 协议类型可以在数组或者字典这样的集合中使用
let things:[TextRepresentable] = [dl2,simon]
for thing in things {
    print(thing.textualDescription)
}

// 协议的继承
// 协议能够继承一个或多个其它协议，可以在继承的协议基础上增加新的内容要求。


// 类专属协议
// 在协议的继承列表中，通过添加class关键字，限制协议职能适配到类类型，结构体或枚举不能遵循该协议。class关键字必须是第一个出现在协议的继承列表中，其后，才是其他继承协议
//protocol SomeClassOnlyProtocol:class,SomeProtocol{
////    协议定义
//}


// 协议组合
// 同时需要遵循多个协议时，可以将多个协议采用protocol<SomeProtocol,AnotherProtocol>这样的格式进行组合，称为协议合成
protocol Named {
    var name:String { get }
}
protocol Aged {
    var age:Int { get }
}
struct Persons: Named, Aged {
    var name: String
    var age: Int
}
func wish(celebrator:protocol<Named, Aged>) {
    print("\(celebrator.name)")
    print(celebrator.age)
}

let birth = Persons(name: "Malcolm", age: 21)
wish(birth)



// 检验协议的一致性

// 可以使用is和as操作符来检查是否遵循某一协议或强制转化为某一类型。
// is操作符用来检查实例是否遵循了某个协议
// as?返回一个可选值，当实例遵循协议时，返回该协议类型；否则返回nil
// as用来强制向下转型，如果强转失败，会引起运行时错误
protocol HasArea {
    var area: Double { get }
}

class Circle:HasArea {
    let pi = 3.1415926
    var radius:Double
    var area:Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius}
}
class Country:HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

class Animal {
    var legs:Int
    init(legs:Int) { self.legs = legs }
}
let objects: [AnyObject] = [Circle(radius: 2.0), Country(area: 25314.0), Animal(legs: 4)]
for object in objects {
    if let objectWithArea = object as? HasArea {
        print("\(objectWithArea.area)")
    } else {
        print("udfhuujhdf")
    }
}

// 对可选协议的规定
// 协议可以含有可选成员，其遵循者可以选择是否实现这些成员。在协议中使用optional关键字作为前缀来定义可选成员.
// 可选协议只能在@objc前缀的协议中生效。这个前缀表示协议将暴露给object-c代码。
@objc protocol CounterDataSource {
    optional func incrementForCount(count: Int) -> Int
    optional var fixedIncrement: Int { get }
}

@objc class Counter {
    var count = 0
    var datasource:CounterDataSource?
    func increment() {
        if let amount = datasource?.incrementForCount?(count) {
             count += amount
        } else if let amount = datasource?.fixedIncrement {
            count += amount
        }
    }
}
@objc class ThreeSourece: CounterDataSource {
    let fixedIncrement = 3
}
var counter = Counter()
counter.datasource = ThreeSourece()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

print("jfhdhj")

class TowardsZeroSource: CounterDataSource {
    func incrementForCount(count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.datasource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}

// 协议扩展
// 使用扩展协议的方式可以为遵循者提供方法或属性的实现。
//extension RandomNumberGenerator {
//    func randomBool() -> Bool {
//        return random() > 0.5
//    }
//}



