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















