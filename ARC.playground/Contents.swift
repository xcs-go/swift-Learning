//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 自动引用计数

// 引用计数仅仅应用于类的实例。结构体和枚举类型是值类型，不是引用类型，也不是通过引用的方式存储盒传递

// 自动引用计数实践
class Person {
    let name:String
    init(name:String) {
        self.name = name
        print("\(name)")
    }
    deinit { // 析构，在对象被释放之前被自动调用
        print("\(name) is dein")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

// 创建新实例(reference1到Person类的新实例之间建立了一个强引用)
reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

// 销毁两个强引用
reference1 = nil
reference2 = nil

// 将第三个强引用也销毁，会调用析构函数，Person的实例会被销毁
reference3 = nil


// 类实例之间的循环强引用

// 通过定义类之间的关系为弱引用或无主引用，以替代强引用，从而解决循环强引用的问题
// 循环强引用
class PersonOne {
    let name:String
    init(name:String) {self.name = name}
    var apartment:Apartment?
    deinit{
        print("\(name) is being denitialized")
    }
}

class Apartment {
    let unit:String
    init(unit:String) {self.unit = unit}
    var tenant:PersonOne?
    deinit{
        print("Apartment \(unit) is being deinitialized")
    }
}

var john:PersonOne?
var unit4A:Apartment?

john = PersonOne(name: "john Appleseed")
unit4A = Apartment(unit: "4A")

// ！是用来展开和访问可选变量john和unit4A中的实例
john!.apartment = unit4A
unit4A!.tenant = john

// 断开john和unit4A变量所持有的强引用，引用计数并不会降为0，实例也不会被ARC销毁
john = nil
unit4A = nil

// 解决实例之间的循环强引用
// swift提供了两种办法用来解决你在使用类的属性时所遇到的循环强引用问题：弱引用和无主引用
// 弱引用和无主引用允许循环引用中的一个实例引用另外一个实例而不保持强引用。
// 何时使用弱引用？何时使用无主引用？
// 对于生命周期中会变为nil的实例使用弱引用。相反的，对于初始化赋值后再也不会被赋值为nil的实例，使用无主引用

// 弱引用
// 申明属性或者变量时，在前面加上weak关键字表明这是一个弱引用
// 弱引用必须被声明为变量，表明其值能在运行时被修改。弱引用不能被声明为常量
class PersonTwo {
    let name:String
    init(name:String) {self.name = name}
    var apartment:ApartmentOne?
    deinit {
    print("\(name) is being deinitialized")
    }
}

class ApartmentOne {
    let unit:String
    init(unit:String) {
        self.unit = unit
    }
    weak var tenant:PersonTwo?  // 弱引用
    deinit{
        print("\(unit) is being deinitialized")
    }
}

var johnOne:PersonTwo?
var unit4AOne:ApartmentOne?
johnOne = PersonTwo(name: "John Appleseed")
unit4AOne = ApartmentOne(unit: "4A")

johnOne!.apartment = unit4AOne
unit4AOne!.tenant = johnOne

// PersonOne的实例将会被销毁
johnOne = nil

// ApartmentOne的实例也将会被销毁
unit4AOne = nil


// 无主引用

// 和弱引用类似，无主引用不会牢牢保持住引用的实例。和弱引用不同的是，无主引用是永远有值的。在声明属性或者变量时，在前面加上关键字unowned表示这是一个无主引用

class Customer {
    let name:String
    var card:CreditCard?
    init(name:String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer:Customer
    init(number:UInt64, customer:Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("\(number) is being deinitialized")
    }
}

var johnTwo:Customer?
johnTwo = Customer(name: "John Appleseed")
johnTwo!.card = CreditCard(number: 1234_9012_3456, customer: johnTwo!)

// 销毁顾客实例
johnTwo = nil


// 无主引用以及隐式解析可选属性
// 两个属性都必须有值，并且初始化完成后永远不会为nil。在这种场景中，需要一个类使用无主属性，而另外一个类使用隐式解析可选属性。

class Country {
    let name:String
    var capitalCity:City!
    init(name:String, capitalName:String) {
        self.name = name
        self.capitalCity = City(name:capitalName,country:self)
    }
}

class City {
    let name:String
    unowned let country:Country
    init(name:String, country:Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")

// 闭包引起的循环强引用
// 循环强引用还会发生在当你将一个闭包赋值给类实例的某个属性，并且这个闭包体中又使用了这个类实例。
// 循环强引用的产生，是因为闭包和类相似，都是引用类型。当把一个闭包赋值给某个属性时，也把一个引用赋值给了这个闭包。

// swift提供了闭包捕获列表来解决这个问题

// 产生
class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML:Void -> String = {
        if let text = self.text {
            return "<\(self.name)> \(text) </\(self.name)>"
        } else {
            return "<\(self.name)>"
        }
    }
    init(name:String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)> \(heading.text ?? defaultText)<\(heading.name)>"
}
print(heading.asHTML())

var paragraph:HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())

// 实例不会被销毁，因为存在着循环强引用
paragraph = nil

// 解决闭包引起的循环强引用
// 在定义闭包时同时定义“捕获列表”作为闭包的一部分，通过这种方式可以解决闭包和类实例之间的循环强引用。
// 捕获列表定义了“闭包体内捕获一个或者多个引用类型的规则”。跟解决两个实例间的循环强引用一样，声明每个捕获的引用为弱引用或无主引用，而不是强引用。
// swift规定，只要在闭包内使用self的成员，就要用self.someProperty或者self.someMethod()

// 定义捕获列表
// 捕获列表中的每一项都由一对元素组成，一个元素是weak或unowned关键字，另一个元素是类实例的引用或初始化过的变量。
// 如果闭包有参数列表和返回类型，把捕获列表放在它们前面
//lazy var someClosure:(Int, String) -> String = {
//    [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess:String) -> String in
//}

// 如果闭包没有指明参数列表或者返回类型，即它们会通过上下文推断，那么可以把捕获列表和关键字in放在闭包最开始的地方
//lazy var someClosure:Void -> String = {
//    [unowned self, weak delegate = self.delegate!] in
//}

// 弱引用和无主引用
// 在闭包和捕获的实例总是互相引用时并且总是同时销毁时，将闭包内的捕获定义为无主引用。相反的，在被捕获的引用可能会变为nil时，将闭包内的捕获定义为弱引用。

class HTMLElementOne {
    let name: String
    let text: String?
    lazy var asHTML: Void -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    init(name:String, text:String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraphs:HTMLElementOne? = HTMLElementOne(name: "p", text: "hello, world")
print(paragraphs!.asHTML())

paragraphs = nil












