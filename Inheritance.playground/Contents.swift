//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 下标脚本
// 下标脚本可以定义在类、结构体和枚举这些目标中,认为是访问集合，列表或序列的快捷方式。使用下标脚本的索引设置和获取值，不需要再调用实例的特定的赋值和访问方法。

// 下标脚本语法
// 定义下标脚本使用subscript关键字，显示声明入参和返回类型
//subscript(index: Int) -> Int {
//    get {
////        返回与入参匹配的int类型的值
//    }
//    set(newValue) {
////        执行赋值操作
//    }
//}
// newValue的类型必须和下标脚本定义的返回类型相同

// 与只读计算属性一样，可以直接将原本应该写在get代码块中的代码写在subscript中
//subscript(index : Int) -> Int {
////    返回与入参匹配的int类型的值
//}

struct TimesTable {
    let multiplier:Int
    subscript(index:Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("\(threeTimesTable[6])")


// 下标脚本用法
// 通常下标脚本是用来访问集合、列表或序列中元素的快捷方式，可以在特定的类或结构体中实现下标脚本来提供合适的功能
var numberOfLegs = ["spider":"8","ant":6,"cat":4]
// 通过下标脚本为字典添加成员
numberOfLegs["bird"] = 2
print("\(numberOfLegs)")
// 通过下标脚本读取字典中的成员
let dictNum = numberOfLegs["spider"]
// 从字典中益处ant项
numberOfLegs["ant"] = nil

// 下标脚本选项
// 下标脚本允许任意数量的入参索引，并且每个入参类型也没有限制。下标脚本的返回值也可以是任何类型。下标脚本可以使用变量参数和可变参数，但使用写入读出参数或给参数设置默认值都是不允许的。
struct Matrix {
    let rows:Int, columns:Int
    var grid:[Double]
    init(rows:Int, columns:Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    func indexIsValidForRow(row:Int, column:Int) -> Bool {
        return row >= 0 && row < row && column >= 0 && column < columns
    }
    subscript(row:Int,column:Int) -> Double {
        get {
            assert(indexIsValidForRow(row, column: column), "index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "index out of range")
            grid[(row * columns) + column] = newValue
        }
        
    }
}

// 继承
// 一个类可以继承另一个类的方法，属性和其它特性。当一个类继承其它类时，继承类叫子类，被继承类叫超类（父类）。swift中，继承是区分类与其它类型的一个基本特征

// 定义一个基类
// 不继承于其它类的类，称之为基类
class Vehicle {
    var currentSpeed = 0.0
    var description:String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        
    }
}

// 初始化一个类实例对象
let someVehicle = Vehicle()
someVehicle.currentSpeed = 5.0
someVehicle.description

let otherVehicle = someVehicle  // 类似于oc的指针传递
otherVehicle.currentSpeed = 6.0
otherVehicle.description
someVehicle.description


// 子类生成
// 子类生成指的是在一个已有类的基础上创建一个新的类。子类继承超类的特性，并且可以优化或者改变它，还可以为子类添加新的特性。

// 将超类名写在子类名的后面，用冒号分隔：
//class SomeClass: SomeSuperclass{
////     类的定义
//}

class Bicycle:Vehicle {
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true

// 子类还可以继续被其它类继承
class Tandem:Bicycle {
    var currentNumberOfPassengers = 0
}
// 创建一个Tandem的实例，你可以使用它所有的新属性和继承的属性，还能查询从Vehicle继承来的只读属性description
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
tandem.description

// 重写
// 子类可以为继承来的实例方法，类方法，实例属性或下标脚本提供自己制定的实现。我们把这种行为叫重写
// 如果需要重写某个特性，需要在重写定义的前面加上override关键字。
// 访问超类的方法，属性及下标脚本
// 在合适的地方，你可以通过使用super前缀来访问超类版本的方法，属性或下标脚本
// 方法：super.method()  访问超类版本的方法
// 属性：super.someProperty  访问超类版本的属性
// 下标脚本：super[someIndex] 访问超类版本中的相同下标脚本

// 重写方法
class Train:Vehicle {
    override func makeNoise() {
        print("choo choo")
    }
}
let train = Train()
train.makeNoise()

// 重写属性
// 可以将一个继承来的只读属性重写为一个读写属性，只需要你在重写版本的属性里提供getter和setter即可。但是，不可以将一个继承来的读写属性重写为一个只读属性
class Car:Vehicle {
    var gear = 1
    override var description:String { // 重写description属性
        return super.description + "  in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("\(car.description)")


// 重写属性观察器
class AutomaticCar:Car {
    override var currentSpeed:Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("\(automatic.description)")

// 防止重写
// 通过把方法，属性或下标脚本标记为final来防止它们被重写，只需要在声明关键字前加上final特性即可.eg : final var     在关键字class前添加final特性final class来将整个类标记为final。这样的类是不可被继承的，任何子类试图继承此类时，在编译时会报错











