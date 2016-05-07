//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
// 泛型：在尖括号里写一个名字来创建一个泛型函数或者类型
func repeatItem<Item>(item:Item, numberOfTimes:Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
repeatItem("knock", 4)

// 创建泛型函数、方法、类、枚举和结构体

/**
*  泛型枚举
*/
enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
    
}
var possibleInteger:OptionalValue<Int> = .None
possibleInteger = .Some(100)


// 在类型名后面使用where来指定对类型的需求，比如，限定类型实现某一个协议，限定两个类型是相同的，或者限定某个类必须有一个特定的父类
//func anyCommonElements <T:SequenceType,U:SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U>


/**
*  常量和变量  :常量的值一旦设定久不能改变，而变量的值可以随意更改

*/
//1:常量：用let来声明常量
// 2:变量：用var老声明变量
//3:可以在一行中声明多个常量或者多个变量，用逗号隔开
// 4:常量与变量名不能包含数学符号，箭头，保留的（或者非法的）Unicode 码位，连线与制表符。也不能以数字开头，但是可以在常量与变量名的其他地方包含数字。


let lan = "swift"
//lan = "swift++"


// 整数
//swift提供了8、16、32和64位的有符号和无符号整数类型。比如8位无符号整数类型是UInt8,32位有符号整数类型是Int32

//整数范围
// 访问不同整数类型的min和max属性来获取对应类型的最小值和最大值,min和max所传回值的类型，正是其所对的整数类型
let minValue = UInt8.min
let maxValue = UInt8.max

// 浮点数
//    • Double 表示64位浮点数。当你需要存储很大或者很高精度的浮点数时请使用此类型。
//     • Float 表示32位浮点数。精度要求不高的话可以使用此类型。

// 类型别名
// 类型别名就是给现有类型定义另外一个名字。使用typealias关键字来定义别名
typealias AudioSample = UInt16
// 定义了一个类型别名之后，可以在任何使用原始名的地方使用别名
var maxAmplitudeFound = AudioSample.min


// 布尔值


// 元组:元组把多个值组合成一个复合制。元组内的值可以是人意类型，并不要求是相同类型
let http404Error = (404, "Not Found")

// 元组的内容分解成单独的常量和变量(全部分解)
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The statusMessage is \(statusMessage)")

// 如果你只需要一部分元组值，分解的时候可以把药忽略的部分用下划线（_）标记(部分分解)
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

// 元组的访问,可以通过下表来访问元组中的单个元素，下表从0开始
print("The status code is \(http404Error.0)")

// 给单个元素命名;给元组中的元素命名后，可以通过名字来获取这些元素的值
let http2006Status = (statusCode:200, description:"OK")
print(http2006Status.description)

//可选类型
// 使用可选类型来处理值可能确实的情况
// 有值，等于x
// 没有值
//let possibleNumber = "123"
//let convertedNumber = Int(possibleNumber)
//print(convertedNumber)

//let possibleNumber = "123"
//let convertedNumber = Int(possibleNumber)
//
//print("hello")

// nil 给可选变量赋值为nil来表示它没有值
var serverResponseCode:Int? = 404
serverResponseCode = nil

// 注意：nil不能用于非可选的常量和变量。


// 如果声明了一个可选常量或者变量但是没有赋值，它们会自动被设置为nil
var surverAnswer:String?   // surverAnser会被自动设置为nil

// if语句以及强制解析
// 可以使用if语句和nil比较来判断一个可选值是否包含值。使用“＝＝”或者“！＝”来执行比较
//if convertedNumber != nil {
//    print("convertedNumber contains some integer value")
//}

// 可选值的强制解析:当你确定可选类型确实包含值之后，可以在可选的名字后面加上！来获取值，表示“直到这个可选有值，使用这个值”.这被称为可选值的强制解析
//if convertedNumber != nil {
//    print("convertedNumber has an integer value of \(convertedNumber!).")
//}

// 可选绑定
// 使用可选绑定来判断可选类型是否包含值，如果包含就把值赋给一个临时变量或者变量.可选绑定可以用在if和while语句中。这条语句不仅可以用来判断可选类型中是否有值，同时可以将可选类型中的值赋给一个常量或者变量。
//if let constantName = someOptional {
//    statements
//}

//if let actualNumber = Int(possibleNumber) {
//    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
//}else {
//    print("\'\(possibleNumber)\' could not be converted to an integer")
//}

// 可以包含多个可选绑定在if语句中，并使用where子句做布尔值判断
//if let firstNumber = Int("4"), secondNumber = Int("42") where firstNumber < secondNumber {
//    print("\(firstNumber)" < "\(secondNumber)")
//}

// 隐士解析可选类型: 在第一次被赋值之后，可以确定一个可选类型总会有值。这种类型的可选状态被定义为隐士解析可选类型.把想要用左可选的类型的后面的问号（string？）改成感叹号（string！）来声明一个隐士解析可选类型

// 隐士可选类型和可选类型之间的区别
let assumedString:String! = "An implicitly unwrapped optional string."
let implicitString:String = assumedString  //不需要感叹号来获取值

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要使用惊叹号来获取值

// 错误处理：使用错误处理来应对程序执行中可能会遇到的错误条件
// 错误处理可以推断失败的原因，并传播至程序的其他部分


// 字符串字面量
// 字符串字面量是由""包裹着的具体有固定顺序的文本字符集。字符串字面量可以用于为常量和变量提供初始值
let someString = "Some string literal value"

// 初始化空字符串
// 要创建一个空字符串作为初始值，可以将空的字符串字面量赋值给变量，也可以初始化一个新的string实例
var emptyString = ""  // 空字符串作为初始值
var anotherEmptyString = String() // 初始化一个新的string实例
// 检查字符串是否为空的方法:利用isEmpty属性来判断一个字符串是否为空
if emptyString.isEmpty {
    print("Nothing to see here")
}

// 字符串可变性
// 可以通过将一个特定字符串分配给一个变量来对其进行修改，或者分配给一个常量来保证其不会被修改
var variableString = "Horse"
variableString += " and carriage"

let constantString = "HighLander"
//constantString += " and another HighLander"  // 会报错


// 字符串时值类型
// 如果创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数／方法中传递时，会进行值拷贝。


// 遍历字符串
// 可以通过forin循环来遍历字符串中的characters属性来获取每一个字符的值
//for character in "Dog!?".characters {
//    print(Character)
//}


// 字符常量
// 可以通过标明一个character类型并用字符字面量进行赋值，可以建立一个独立的字符常量或变量
let exclamationMark: Character = "!"

// 字符串可以通过传递一个值类型为character的数组作为自变量来初始化字符串
let catCharacters:[Character] = ["c", "a", "t", "!", "?"]
let catString = String(catCharacters)
print(catString)

// 连接字符串和字符
// 字符串可以通过加法运算符（＋）相加在一起创建一个新的字符串
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

// 也可以通过＋＝ 将一个字符串添加到一个已经存在字符串的变量上
var instruction = "look over"
instruction += string2

// 也可以用append()方法将一个字符加到一个字符串变量的尾部
let exclamationMarks: Character = "!"
welcome.append(exclamationMarks)

// 不能将一个字符串或者字符添加到一个已经存在的字符变量上，因为字符变量只能包含一个字符
var char:Character = "a"
let greet = "hello"
//char += greet   // 这是错误的
//char.append(greet)  // 这是错误的

// 字符串插值
// 字符串插值是一种构建新字符串的方式，可以在其中包含常量、变量、字面量和表达式。插入的字符串字面量的每一项都在以反斜线为前缀的圆括号中
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
//let message1 = "\(multiplier)" + " times 2.5 is"


// 计算字符数量
// 如果想要获得一个字符串character值的数量，可以使用字符串的characters属性的count属性
let unusualMenagerie = "Koala ?, Snail ?, Dromedary ?"
//print("unusualMenagerie has \(unusualMenagerie.characters.count)")
//print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

// 访问和修改字符串
// 可以通过字符串的属性和方法来访问和读取它，也可以用下标语法完成
//1:字符串索引;每一个string都有一个关联的index类型，string.index，对应着字符串中的每一个character的位置。
// 字符串索引的相关方法:startIndex属性可以获取string的第一个character的索引;endIndex属性可以获取最后一个character的后一个位置的索引，如果string为空，startIndex与endIndex相等;调用string.Index的predecessor()方法，可以得到前面一个索引，调用successor()方法可以得到后面一个索引。任何一个string的索引都可以通过锁链作用的这些方法来获取另一个索引，也可以调用advancedBy(_:)方法来获取
let greeting = "Cuten Tag!"
// 获取第一个字符
greeting[greeting.startIndex]
// 获取最后一个字符
greeting[greeting.endIndex.predecessor()]
// 获取下一个字符
greeting[greeting.startIndex.successor()]

// 获取某一个特定的字符
//let index = greeting.startIndex.advancedBy(7)
//greeting[index]

// characters属性的indices属性会创建一个包含全部索引的范围Range，用来在一个字符串中访问单个字符
//for index in greeting.characters.indices {
//
//}

// 插入和删除
// 调用insert(_:atIndex:)方法可以在一个字符串的指定索引插入一个字符
var welec = "hello"
welec.insert("!", atIndex: welec.endIndex)
//调用insertContentsOf(_:at:)方法可以在一个字符串的指定索引插入一个字符串
//welcome.insertContentsOf(" there".characters, at: welcome.endIndex.predecessor())
// 调用removeAtIndex(_:)方法可以在一个字符串的指定索引删除一个子字符,并且返回被移除的字符
let sr = welec.removeAtIndex(welec.endIndex.predecessor())
print(sr)

// 调用removeRange(_:)方法可以在一个字符串的指定索引删除一个字符串
//let range = welec.endIndex.advancedBy(-2)..<welec.endIndex
//welec.removeRange(range)

// 比较字符串
// swift提供了三种方式来比较文本值：字符串字符相等、前缀相等和后缀相等
//1:字符串、字符相等:用“==”和“!=”来判断
let quotation = "we're a lot alike,you and i."
let sameQuotation = "we're a lot alike,you and i."
if quotation == sameQuotation {
    print("same")
}

// 2:前缀、后缀相等：调用字符串的hasPrefix(_:)/hasSuffix(_:)方法来检查字符串是否拥有特定前缀／后缀，两个方法均接受一个string类型的参数，并且返回一个boolean值