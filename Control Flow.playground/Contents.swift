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


