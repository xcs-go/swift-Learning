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











