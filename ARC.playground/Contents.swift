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




















