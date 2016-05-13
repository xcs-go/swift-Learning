//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 可空链式调用

// 可空链式调用是一种可以请求和调用属性、方法及下标的过程，它的可空性体现于请求或调用的目标当前可能为空。如果可空的目标有值，那么调用就会成功；如果选择的目标为空，那么这种调用将返回空。多个连续的调用可以被链接在一起形成一个调用链，如果其中任何一个节点为空将会导致整个链调用失败。


// 使用可空链式强调来强制展开
// 通过在想调用非空的属性、方法、或下标的可空值后面放一个问号，可以定义一个可空链。
class Person {
    var residence:Residence?
}

class Residence {
    var numberOfRooms = 1
}
let john = Person()

// 使用!强制展开这个john的residence属性的numberOfRooms值，会出发运行时错误
//let roomCount = john.residence!.numberOfRooms

// swift 提供了另一种访问numberOfRooms的方法，使用?来代替原来叹号!的位置
if let roomCount = john.residence?.numberOfRooms {
    print("\(roomCount)")
} else {
    print("unable to retrieve the number of rooms.")
}

john.residence = Residence()


// 为可空链式调用定义模型类
// 通过使用可空链式调用可以调用多层属性，方法，和下标。这样可以通过各种模型访问各种子属性。并且判断能否访问子属性的属性，方法或下标
class Residences {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i:Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRoom() {
        print("\(numberOfRooms)")
    }
    var address:Address?
}

class Address {
    
}





















