//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// For 循环
// swift提供了两种for循环：for--in / for

//for in 循环对一个集合里面的每个元素执行一系列语句
//for 循环，用来重复执行一系列语句直到达成特定条件，一般通过在每次循环完成后增加计数器的值来实现

//for in:可以使用for-in循环来遍历一个集合里面的所有元素，例如由数字表示的区间、数组中的元素、字符串中的字符
for index in 1...5{
    print("\(index) time 5 is \(index * 5)")
}

// 如果你不需要知道区间序列内每一项的值，你可以使用下划线“_”替代变量名来忽略对值的访问
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

// 使用for-in 遍历一个数组所有元素
let names = ["Anna","Alex","Brian","Jack"]
for name in names{
    print("Hello,\(name)!")
}


// 可以遍历一个字典来访问它的健值对。遍历字典时，字典的每项元素会以（key,value）元组的形式返回，可以在for in循环中使用显式的常量名称来解读(key,value)元组。
let numberOfLegs = ["spider":"8","ant":"6","cat":"4"]
for(animalNam,legCount) in numberOfLegs{
    print("\(animalNam)s have \(legCount) legs")
}


// 注意：字典元素的遍历顺序和插入顺序可能不同，字典的内容在内部是无序的，所以遍历元素是不能保证顺序。

//For 循环 swift提供使用条件判断和递增方法的标准C样式for循环
for var index = 0;index<3; ++index{
    print("index is \(index)")
}

// while循环
//while循环运行一系列语句直到条件变成false。这类循环适合使用在第一次迭代次数未知的情况下。
// while循环，每次在循环开始时计算条件是否符合,如果不符合，则跳过循环，符合条件才会执行循环里面的代码
// repeat-while循环，每次在循环结束时计算条件是否符合


// 条件语句
//if和switch；if语句he其它语言的if语句一样，只是没有了()

//switch 区间匹配 case分支的模式也可以是一个值的区间。
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount:String
switch approximateCount{
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "serveral"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")


// 元组 ，我们可以使用元组在同一个switch语句中测试多个值，元组中的元素可以是值，也可以是区间，另外，使用下划线（_）来匹配所有可能的值
let somePoint = (1,1)
print("\(somePoint.1)")  // 可以利用点语法从元组中取出某个值
switch somePoint{
case(0,0):
    print("(0,0) is at the origin")
case(_,0):
    print("(\(somePoint.0),0) is on the x-axis")
case(0,_):
    print("(0,\(somePoint.1)) is on the y-axis")
case(-2...2,-2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}


// 带标签的语句

// 使用标签来标记一个循环体或者switch代码块，当使用break或者continue时，带上这个标签，可以控制标签代表对象的中断或者执行
// 产生一个带标签的语句是通过在该语句的关键词的同一行前面放置一个标签，并且该标签后面还需要带着一个冒号。
//label name:while condition{
//}

// 提前退出
// 像if语句一样，guard的执行取决于一个表达式的布尔值。可以使用guard语句来要求条件必须为真时，以执行guard语句后的代码。不同于if语句，一个guard语句总是有一个else分句，如果条件不为真则执行else分句中的代码

//func greet(person:[String:String]){
//    guard let name = person["name"] else{
//        return
//    }
//    print("hello \(name)")
//    
//    guard let location = person["location"] else {
//        print("I hope the weather is nice near you.")
//        return
//    }
//    print("I hope the weather is nice in \(location)")
//}


// 函数

// 1:函数的定义与调用
// 定义函数时，可以定义函数的参数和参数的类型，也可以定义函数的返回值
// 每个函数有个函数名。用来描述函数执行的任务，使用函数时，使用函数名调用函数吗并且给该函数传递相关的参数
func sayHello(person:String) -> String {
    let greeting = "hello, " + person + "!"
    return greeting
}
print(sayHello("lmg"))

// 函数参数与返回值
//1:无参函数
func sayHelloWorld() -> String{
    return"hello world"
}
print(sayHelloWorld())

// 2:多参数函数
// 函数可以带有多种参数，参数类型也可以不相同，这些参数被包含在函数的括号中，相互之间用逗号分隔
func sayHi(personName:String, alreadyGreeted:Bool) -> String {
    if alreadyGreeted {
        return sayHello(personName)
    } else {
       return sayHelloWorld()
    }
}
print(sayHi("Tim", true))


//3:无返回值函数
func sayGoodbye(personName: String) {
    print("Goodbye, \(personName)!")
}
sayGoodbye("Dave")

// 被调用时，一个函数的返回值可以被忽略
//func printAndCount(StringToPrint:String) -> Int {
//    print(StringToPrint)
//    return StringToPrint.characters.count
//}
//func printWithoutCounting(stringToPrint:String) {
//    printAndCount(stringToPrint) // 被调用，函数的返回值被忽略
//}
//
//printAndCount("hello world")

// 多重返回值函数
// 使用元组类型让多个值作为一个复合值从函数中返回

//func minMax(array:[Int]) -> (min:Int,max:Int) {
//    var currentMin = array[0]
//    var currentMax = array[0]
//    for value in array[1..<array.count]{
//        if value < currentMin {
//            currentMin = value
//        }else if value > currentMax {
//            currentMax = value
//        }
//    }
//    return(currentMin,currentMax)
//}
//print(minMax([2,5,6,8,0,74,85]))

// 可选元组返回类型
// 如果函数返回的元组类型有可能整个元组都没有值，则可以在元组的返回值的右括号中添加一个❓来表示该元组是一个可选的。

func minMax(array:[Int]) -> (min:Int,max:Int)? {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin {
            currentMin = value
        }else if value > currentMax {
            currentMax = value
        }
    }
    return(currentMin,currentMax)
}
print(minMax([2,5,6,8,0,74,85]))
// 可以使用可选绑定来检查minMax:函数返回的是一个实际的元组值还是nil


// 函数参数名称

// 函数参数都有有一个外部参数名和一个局部参数名，外部参数名用于在函数调用时标注传递给函数的参数，局部参数名在函数的实现内部使用
//func someFunction(firstParameterName:Int,secondParameterName:Int) {
//    
//}
//
//someFunction(1, 2)

// 指定外部参数名:在局部参数名前指定外部参数名，中间以空格分隔
func say(to person:String,and anotherPerson:String) -> String {
    return "hello \(person) and \(anotherPerson)"
}
print(say(to: "Bill", and: "Ted"))

// 可变参数：一个可变参数可以接受零个或多个值。函数调用时， 你可以用可变参数来指定函数参数可以被传入不确定数量的输入值通过在变量名后面加入（...）的方式来定义可变参数。

// 可变参数的传入值在函数体中变为此类型的一个数组。一个函数最多只有一个可变参数
func arithmeticMean(numbers:Double...) -> Double {
    var total:Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1,2,3,4,5)


// 常量参数和变量参数
//func alignRight(var String:String,totalLength:Int,pad:Character) -> String {
//    let amountToPad = totalLength - String.characters.count
//    if amountToPad<1{
//        return String
//    }
//    let padstring = String(pad)
//    for _ in 1...amoutToPad {
//        String = padstring + String
//    }
//    return String
//}
//
//let originalString = "hello"
//let paddedString = alignRight(originalString, 10, "-")

// 输入输出参数
// 如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数.在参数定义前加input关键字,传入参数时，需要在参数名前加&符，表示这个值可以被修改
func swapTwoInts(inout a:Int,inout b:Int){
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)


// 函数类型
func addTwoInts(a:Int,b:Int) -> Int {
    return a + b
}

func mulitiplyTwoInts(a:Int,b:Int) -> Int {
    return a * b
}

// 使用函数类型
// 在swift中，使用函数类型就想使用其他类型一样。可以定义一个类型为函数的常量或变量，并将适当的函数赋值给它
var mathFunction:(Int,Int) -> Int = addTwoInts
// 通过使用mathFunction来调用被赋值的函数
print("\(mathFunction(2,3))")

// 有相同匹配类型的不同函数可以被赋值给同一个变量
mathFunction = mulitiplyTwoInts
print("\(mathFunction(2,3))")

// 函数类型作为参数类型
func printMathResult(mathFunction:(Int,Int) -> Int,a
    :Int,b:Int) -> Int {
//        print("\(mathFunction(a,b))")
        return mathFunction(a,b)
}
printMathResult(addTwoInts, 3, 4)

// 函数类型作为返回类型
// 在返回箭头后写一个完整的函数类型

func stepForward(input:Int) -> Int {
    return input + 1
}

func stepBackward(input:Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards:Bool) -> (Int) ->Int {
    return backwards ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)

// 嵌套函数 : 在一个函数体中定义另一个函数，叫做嵌套函数
// 默认情况下，嵌套函数是对外界不可见的，但是可以被它们的外围函数调用，一个外围函数也可以返回它的某一个嵌套函数，使得这个函数可以在其他领域中被调用

// 闭包
// 闭包是自包含的函数代码块，可以在代码中被传递和使用。闭包可以捕获和存储其所在上下文中任意常量和变量的应用。这就是所谓的闭合并包裹着这些常量和变量，俗称闭包

// 闭包的三种形式
//1:全局函数是一个有名字但不会捕获任何值的闭包
//2:嵌套函数是一个有名字并可以捕获其封闭函数内值的闭包
//3:闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量的值的匿名闭包

//swift 的闭包表达式拥有简洁的风格，并鼓励在常见场景中进行语法优化
//1:利用上下文推断参数和返回值类型
//2:隐士返回单表达式闭包，即单表达式闭包可以省略return关键字
//3:参数名称缩写
//4:尾随闭包语法


// 闭包表达式

// sort方法:会根据提供的用于排序的闭包函数将已知类型数组中的值进行排序，排序完成后，sort方法会返回一个与原数组大小相同，包含同类型元素且元素已正确排序的新数组。
let stringNames = ["Chris","Alex","Ewa","Barry","Daniella"]
//func backWards(s1:String,s2:String) -> Bool{
//    return s1 > s2
//}
//var reversed = stringNames.sorted(backWards)
//
//print("\(reversed)")

// 闭包表达式语法形式:
//    {(parameters) -> returnType in  闭包的函数体部分由关键字in引入，该关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始
//        statements
//}

var reversed = stringNames.sorted({(s1:String,s2:String) -> Bool in
    return s1 > s2
})

// 根据上下文推断类型：通过内联闭包表达式构造的闭包作为参数传递给函数或方法时，都可以推断出闭包的参数和返回值类型。这意味着闭包作为函数或者方法的参数时，几乎不需要利用完整格式构造内联闭包.

reversed = stringNames.sorted({s1,s2 in return s1 > s2})
print("\(reversed)")


// 单表达式闭包隐士返回
// 单行表达式闭包可以通过省略return关键字来隐士返回单行表达式的结果
reversed = stringNames.sorted({s1,s2 in s1 > s2})

// 参数名称缩写
// swift自动为内联闭包提供了参数名称缩写功能,可以直接通过$0,$1,$2来顺序调用闭包的参数.如果在闭包表达式中使用参数名称缩写，您可以在闭包参数列表中省略对其的定义，并且对应参数名称缩写的类型会通过函数类型进行推断。in关键字也同样可以被省略
reversed = stringNames.sorted({$0 > $1})

// 运算符函数
//swift的string类型定义了有关“>”的字符串实现，其作为一个函数接受两个String类型的参数并返回Bool类型的值。swift可以自动推断您想使用大于号的字符串函数实现
reversed = stringNames.sorted(>)

// 尾随闭包
// 如果您需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性。尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用:
func someFunctionThatTakesAClosure(closure:() -> Void) {
//    函数体部分
}

// 以下是不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure({
//    闭包主体部分
})

// 一下是使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(){
//    闭包主体部分
}

reversed = stringNames.sorted(){(s1:String,s2:String) -> Bool in s1 > s2}
print("\(reversed)")

reversed = stringNames.sorted(){s1,s2 in s1 > s2}

reversed = stringNames.sorted(){$0 > $1}

// 如果函数只需要闭包表达式一个参数，当使用尾随闭包时，可以把()省略掉
reversed = stringNames.sorted{$0 > $1}
print("\(reversed)")


// Array类型的map(_:)方法，其获取一个闭包表达式作为其唯一参数，该闭包函数会为数组中的每一个元素调用一次，并且返回该元素所映射的值。具体的映射方式和返回值类型由闭包来指定
let  digitNames = [
    0:"Zero",1:"One",2:"Two",3:"There",4:"Four",5:"Five",6:"Six",7:"Seven",8:"Eight",9:"Nine"
]

let numbers = [16,58,510]
let strings = numbers.map{(var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

// 捕获值
// 闭包可以在其被定义的上下文中捕获常量或变量。即便定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值
func makeIncrementor(forIncrement amout:Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amout
        return runningTotal
    }
    return incrementor   // 函数可以作为一个返回值返回
}


// 为了优化，如果一个值是不可变的，swift可能会改为捕获并保存一份对值的拷贝
let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()


// 如果创建了另一个incrementor,它会有属于它自己的一个全新、独立的runningTotal变量的引用;再次调用原来的incrementByTen会在原来的变量runningTotal上继续增加值，该变量和increnmentBySeven中捕获的变量没有任何联系
let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()
incrementByTen()

// 闭包是引用类型
// 函数和闭包都是引用类型
// 无论将函数或闭包赋值给一个变量还是常量，实际上都是将变量或常量的值设置为对应函数或闭包的引用.因此，如果将闭包赋值给了两个不同的常量或变量，两个值都会指向同一个闭包
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()


// 非逃逸闭包
// 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当定义接受闭包作为函数的参数时，可以在参数名之前标注@noescape,用来指明之歌闭包不允许“逃逸”出这个函数.
// 闭包职能在函数体中执行，不能脱离函数体执行

func someFunctionWithNoescapeCloure(@noescape cloure:() -> Void) {
    
}

var completionHandlers:[() -> Void] = []  // 定义了一个数组变量
func someFunctionWithEscapingClosure(completionHandler: () -> Void) {
    completionHandlers.append(completionHandler)
}
//print("irhjdf")

class someClass {
    var x = 10
    func dosomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNoescapeCloure({x = 200})
    }
}
let instance = someClass()
instance.dosomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)
completionHandlers.last?()
print(instance.x)


// 自动闭包
// 自动闭包是一种自动创建的闭包,用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。
// 自动闭包让你能够延迟求值

var customersInLine = ["Chris","Alex","Ewa","Barry","Daniella"]
print(customersInLine.count)

let customerProvider = {customersInLine.removeAtIndex(0)}  // {}创建自动闭包
print(customersInLine.count)

// 当它被调用的时候，会返回被包装在其中的表达式
print(customerProvider())

// 当它被调用的时候，会返回被包装在其中的表达式
print("Now servins \(customerProvider())!")

print(customersInLine.count)

// 将闭包作为参数传递给函数时，能获得同样的延时求值行为
func serveCustomer (customerProvider:() -> String) { // 说明接受的是显式的闭包
    print("now serviing \(customerProvider())!") // 调用闭包
}
serveCustomer(customerProvider) // serveCustomer({customerInLine.removeAtIndex(0)})
print(customersInLine.count)


// @autoclosure ：标记接收一个自动闭包
func serverCustomer(@autoclosure customerProvider:() -> String) { // 说明接受的是自动闭包
    print("Now serving \(customerProvider())!")
    
}
serverCustomer(customerProvider())

// @autoclosure 特性暗含了@noescape特性。如果你想让这个闭包可以“逃逸”，则应该使用@autoclosure(escaping)特性

var customereProviders: [() -> String] = []
func collectCustomerProviders(@autoclosure(escaping) customerProvider: () -> String) {
    customereProviders.append(customerProvider)
}

collectCustomerProviders(customerProvider())

print("Collected \(customereProviders.count) closures.")

for custo in customereProviders {
    print("Now serving \(customerProvider())!")
}
print("Collected \(customereProviders.count) closures.")

















