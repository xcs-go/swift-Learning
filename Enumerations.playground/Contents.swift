//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 枚举为一组相关的值定义了一个共同的类型，方便在代码中以类型安全的方式来使用这些值
//swift 中的枚举不必给每一个枚举成员提供一个值。如果给枚举成员提供一个值（“原始”值），则该值的类型可以是字符串，字符，或是一个整型值或浮点数。此外，枚举成员可以指定任意类型的关联值存储到枚举成员中。

// 枚举语法
// enum 关键字来创建枚举并且把它们的整个定义放在一对大括号内:
enum SomeEnumeration {
//    枚举定义放置处
}

// eg: case 是关键字,表示的是定义一个新的枚举成员值
enum CompassPoint {
    case North
    case South
    case East
    case West
}
// 与oc和c语言不同，swift的枚举成员在被创建时不会被赋予一个默认的整型值。这些枚举成员自身就是完备的值，这些值的类型是已经明确定义好的"枚举名称"类型

// 多个枚举成员值可以出现在同一行上，用逗号隔开
enum Planet {
    case Mercury,Venus,Earth,Mars,Jupiter,Saturn,Uranus,Neptune
}

var directionToHead = CompassPoint.West // 可以使用点语法访问枚举的成员

// 当directionToHead被声明为CompassPoint类型，可以使用更加精简的语法为其设置为另一个值,省略枚举类型名称
directionToHead = .East


// 使用switch语句匹配枚举值
directionToHead = .South
switch directionToHead {
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out for penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}


// 关联值
enum Barcode {
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}

// 表示的是Barcode枚举类型中的两个成员变量UPCA和QRCode分别关联着(Int,Int,Int,Int)类型和string类型
// 创建关联值
var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)

// 将变量分配给给另一个枚举成员变量,原来的被替代
productBarcode = .QRCode("ujfshsdhsdh")

// 使用switch匹配；关联值可以被提取出来作为switch语句的一部分，在switch的case分支代码中提取每个关联值作为一个常量或者作为一个变量来使用
switch productBarcode {
case .UPCA(let numberSystem, let manufacture, let product, let check):
    print("UPCA-A: \(numberSystem), \(manufacture), \(product), \(check)")
case .QRCode(let productCode):
    print("QR code: \(productCode)")
}

// 如果一个枚举成员的所有关联值都被提取为常量，或者都被提取为变量，为了简洁，你可以只在成员名称前标注一个let或者var
switch productBarcode {
case let .UPCA(numberSystem,manufacture,product,check):
    print("UPCA:\(numberSystem), \(manufacture), \(product), \(check)")
case let .QRCode(productCode):
    print("QRCode: \(productCode)")
}


// 原始值
// 作为关联值的替代选择，枚举成员可以被默认值（称为原始值）预填充，这些原始值的类型必须相同
// 原始值可以是字符串，字符，或者任意整型值或浮点型值，每个原始值在枚举声明中必须是唯一的。

enum ASCIIControlCharacter:Character { // 枚举类型ASCIIControlCharacter的原始类型被定义为character
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

// 原始值的隐士赋值
// 当原始值为整数或者字符串型的枚举时，不需要显示地为每一个枚举成员设置原始值，swift将会自动赋值
// 当使用整数作为原始值时，隐式赋值的值依次递增1，如果第一个枚举成员没有设置原始值，其原始值将为0
enum PlaneT: Int {
    case Mercury = 1, venus, Earth, Mars, Jupiter, Saturn, Uranus,Neptune
}

// 当使用字符串作为枚举类型的原始值时，每个枚举成员的隐式原始值为该枚举成员的名称
enum ComPassPoint: String {
    case North = "North", South = "South", East = "East", West = "West"
}

// 枚举成员的rawValue属性可以访问该枚举成员的原始值
// 枚举成员的hashValue属性可以访问该枚举成员的hash值
let earthsOrder = PlaneT.Mercury.rawValue
let comValue = ComPassPoint.South.hashValue

// 使用原始值初始化枚举实例
// 如果在定义枚举类型的时候使用了原始值，那么将会自动获得一个初始化方法，这个方法接受一个叫做rawValue的参数，参数类型即为原始值类型，返回值则是枚举成员或nil
let possiblePlanet = PlaneT(rawValue: 2)
print("\(possiblePlanet)")

let earString = ComPassPoint(rawValue: "East")
print("\(earString)")


// 递归枚举
// 递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。可以在枚举成员前加上"indirect"来表示该成员可递归


// 类和结构体
//swift中类和结构体有很多共同点
//1:定义属性用于存储值
//2:定义方法用于提供功能
//3:定义附属脚本用于访问值
//4:定义构造器用于生成初始值
//5:通过扩展以增加默认实现的功能
//6:实现协议以提供某种标准功能

// 与结构体相比，类还有如下的附加功能
//1:继承允许一个类继承另一个类的特征
//2:类型转换允许在运行时检查和解释一个类实例的类型
//3:解构器允许一个类实例释放任何其所被分配的资源
//4:引用计数允许对一个类的多次引用

// 结构体总是通过被赋值的方式在代码中传递，不使用引用计数

//定义
// 类和结构体有着类似的定义方式。通过关键字class和struct来分别表示类和结构体，并且在一对大括号中定义它们的具体内容：
// 类
//class SomeClass {
////    具体内容
//}

// 结构体
//struct SomeStructure {
////    具体内容
//}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode  {
    var resolution = Resolution()
    var interlaced = false
    var frameRect = 0.0
    var name : String?
}

// 类和结构题实例
let someResolution = Resolution()
let someVideoMode = VideoMode()

// 结构体和类都适用构造器语法来生成新的实例，构造器语法的最简单形式是在结构体或者类型名称后跟随一对空括号。

// 属性访问
// 通过使用点语法，可以访问实例的属性。
print("\(someResolution.width)")
print(someResolution.height)

print( "\(someVideoMode.frameRect)")
print(someVideoMode.resolution.height)
print(someVideoMode.interlaced)


// 可以使用点语法为变量属性赋值.和oc不同的是swift允许直接设置结构体属性的子属性
someVideoMode.resolution.width = 1280
someVideoMode.name = "usdhsu"
print(someVideoMode.name)


// 结构体类型的成员逐一构造器
// 所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。新实例中各个属性的初始值可以通过属性名称传递到成员逐一构造器之中。
let vga = Resolution(width: 640, height: 480)

// 结构体和枚举是值类型
// 值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝

// 在色swift中，所有的结构体和枚举类型都是值类型。

let hd = Resolution(width: 1920, height: 1920)
var cinema = hd // 值拷贝

cinema.width = 2048
print(cinema.width)
print(hd.width)

// 枚举也遵循相同的行为准则
enum ComPassPoinT {
    case North, South, East, West
}
var currentDirection = ComPassPoinT.West
let rememberedDirection = currentDirection
currentDirection = .East // 改变值
if rememberedDirection == .West {
    print("hello")
}

//  类是引用类型
// 与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。因此，引用的是已存在的实例本身而不是其拷贝;类似于oc中的指针地址
let tenEighty = VideoMode() // 实例化一个类
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRect = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRect = 30.0
print(tenEighty.frameRect)
print(alsoTenEighty.frameRect)


// 恒等运算符
// 由于类是引用类型，有可能有多个常量和变量在幕后同时引用同一个类实例,swift内建了两个恒等运算符，可以判断两个常量或者变量是否引用同一个类实例

// 等价于（===）
// 不等价于（!==）
// 运用这两个运算符可以检测两个常量或者变量是否引用同一个实例
if tenEighty === alsoTenEighty { // 判断两个常量是否引用同一个类的实例
    print("tenEighty and alsoTenEighty refer to the same VideoModel instance")
}

// 字符串、数组、字典类型的赋值与复制行为
// 在swift中，许多基本类型，诸如String,Array和Dictionary类型均已结构体的形式实现。这意味着被赋值给新的常量或者变量，或者被传入函数方法中时，它们的值会被拷贝。

// 属性

// 1:存储属性：一个存储属性就是存储在特定类或结构体的实例里的一个常量或变量。存储属性可以是变量存储属性，也可以是常量存储属性

struct FixedLengthRange {
    var firstValue:Int
    let length:Int // 在创建结构体实例后不能修改值
}

var rangeOfThereItems = FixedLengthRange(firstValue: 0, length: 3)  // 区间表示0，1，2
rangeOfThereItems.firstValue = 6 // 区间表示6，7，8


// 常量结构体的存储属性
// 如果创建了一个结构体的实例并将其赋值给一个常量，则无法修改实例的任何属性，即使定义了变量存储属性
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)

// 以下修改会发生错误:cannot assign to "" in ""
////rangeOfFourItems.firstValue = 6
//let range1 = rangeOfThereItems
//range1.firstValue = 2

// 值类型：当值类型的“实例”被声明为常量的时候，它的所有属性也就成了常量，不可再次被修改
// 引用类型：把一个引用类型的“实例”赋给一个常量后，仍然可以修改实例的变量属性
class Person {
    var name:String = ""
    var age:Int?
    var hight:Float?
}

let PersonOne = Person()
PersonOne.name = "xcs"
PersonOne.age = 23
PersonOne.hight = 1.66
print("\(PersonOne.hight)")

let PersonTwo = PersonOne
PersonTwo.age = 22
print("\(PersonOne.age)")


// 延迟存储属性（类似于懒加载）
// 延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用lazy来标示一个延迟存储属性
//必须将延迟存储属性声明成变量，因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性
class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter() // 使用了lazy，属性只有在第一次被访问的时候才被创建
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

print(manager.importer.fileName) // importer属性第一次被创建


// 计算属性
// 除存储属性外，类、结构体和枚举可以定义计算属性。计算属性不直接存储值，而是提供一个getter和一个可选的setter，来间接获取和设置其他属性或变量的值
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center:Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter) { // newCenter 表示新值的参数名
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)

// 只读计算属性
// 只有getter没有setter的计算属性就是只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。
// 只读计算属性的声明可以去掉get关键字和花括号
struct Cubiod {
    var width = 0.0 , height = 0.0 , depth = 0.0
    var volume:Double { // 只有getter方法,省略了get关键字和花括号
        return width * height * depth
    }
}

// 生成结构体实例
let fourByFiveByTwo = Cubiod(width: 4.0, height: 5.0, depth: 2.0)
print(fourByFiveByTwo.volume)


// 属性观察器

// 属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，甚至新的值和现在的值相同的时候也不例外

// 为属性添加如下的一个或全部观察器：
//    willSet 在新的值被设置之前调用  （会将新的属性值作为常量参数传入）
//    didSet  在新的值被设置之后立即调用

class StepCounter {
    var totalSteps:Int = 0 {
//         被设置之前会被调用
        willSet(newTotalSteps) {
            print("\(newTotalSteps)")
        }
        
//         被设置完成之后立即调用
        didSet {
            if totalSteps > oldValue {
                print("\(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

// 类型属性
// 不管类型有多少个实例，这些属性都只有唯一一份，这种属性就是类型属性


// 类型属性语法
// 在swift中，类型属性是作为类型定义的一部分写在"类型最外层的花括号内"，因此它的作用范围也就在类型支持的范围内
// 使用关键字static来定义类型属性。

// 存储型类型属性的语法

struct SomeStructure {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        get {
            return 1
        }
    }
}

enum SomeEnumerations {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty : Int {
        get {
            return 6
        }
    }
}


//计算型类型
class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedType : Int {
        get {
            return 27
        }
    }
    class var overrideableComputedType: Int {
        get {
            return 107
        }
    }
}

// 获取和设置类型属性的值

// 获取
print(SomeStructure.storedTypeProperty)

// 设置
SomeStructure.storedTypeProperty = "dsudfju"
print(SomeStructure.storedTypeProperty)

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannel = 0
    var currentLevel:Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannel {
                AudioChannel.maxInputLevelForAllChannel = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 7
rightChannel.currentLevel = 11
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannel)
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannel)









