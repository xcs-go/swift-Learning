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


// 构造过程
// 构造过程是使用类、结构体或枚举类型一个实例的准备过程。
// 通过构造器来实现构造过程，这些构造器可以看做是用来创建特定类型新实例的特殊方法。

// 存储属性的初始值
// 类和结构体在创建实例时，必须为所有存储型属性设置合适的初始值。存储型属性的值不能处于一个未知的状态。

// 构造器
//init() {
////    在此处执行构造过程
//}

struct Fahrenheit {
    var temperature:Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print(f.temperature)
f.temperature = 40.0
print(f.temperature)


// 自定义构造过程
// 通过输入参数和可选属性类型来自定义构造过程，也可以在构造过程中修改常量属性

// 构造参数
struct Celsius {
    var temperatureInCelsius:Double
    init(fromFahrenheit fahrenheit:Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin:Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

// 通过不同的构造器创建不同的实例
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)


// 参数的内部名称和外部名称
// 跟函数和方法参数相同，构造参数也存在一个构造器内部使用的参数名字和一个在调用构造器时使用的外部参数名字。
// 如果在定义构造器时没有提供参数的外部名字，swift会为每个构造器的参数自动生成一个跟内部名字相同的外部名。

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white:Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

// 如果不通过外部参数名字传值，是没有办法调用这个构造器的，只要构造器定义了某个外部参数名，就必须使用它，忽略它将会导致编译报错
//let very = Color(1.0,0.0,1.0) 编译会报错


// 不带外部参数名的构造器
struct Colors {
    let red, green, blue:Double
//     不希望green提供外部名字，使用"_"来显示描述它的外部名
    init(red:Double, _ green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}
// 由于在构造器里green参数使用了"_"来显示描述外部名，所以这里的green的外部名称没有显示出来
let colors = Colors(red: 1.0, 0.0, blue: 0.5)

struct Celsiuss {
    var temperatureInCelsius: Double = 0.0
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsiuss: Double) {
        temperatureInCelsius = celsiuss
        print("\(temperatureInCelsius)")
    }
}
// 如果在结构体、枚举、类中声明了构造器，在实例化时没有使用构造器来实例化会报错
//let bodyTemperature = Celsiuss()
//print(bodyTemperature.temperatureInCelsius)

let bodyTemperature = Celsiuss(37.0)
print(bodyTemperature.temperatureInCelsius)

// 可选属性类型
// 如果定制的类型包含一个逻辑上允许取值为空的存储属性：不管是因为它无法在初始化时赋值，还是因为它可以在之后某个时间点可以赋值为空，都需要将它定义为可选类型option type。可选类型的属性将自动初始化为空nil,表示这个属性是故意在初始化时设置为空的
class SurveyQuestion {
    var text:String
    var response:String? // 可选属性类型
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "yes, i do like cheese"
print(cheeseQuestion.response)


// "构造过程中"常量属性的修改
// 可以在构造过程中的任意时间点修改常量属性的值，只要在构造过程结束时是一个确定的值。一旦常量属性被赋值，它将永远不可改变
// 对于类的实例来说，它的常量属性只能在定义它的类的构造过程中修改，不能在子类中修改
class SurveyQuestions {
    let text:String
    var response:String?
    init(text: String) {
        self.text = text // 在类的构造器中设置常量的值
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestions(text: "How about beets?") // 在这里时，类中的常量已经被赋值，不能再次被修改，如果再次修改会报错
beetsQuestion.ask()
beetsQuestion.response = "I also like beets.(But not with cheese)"

// 修改已经被赋值的常量会报错
//beetsQuestion.text = "juhdhfdhhyd"

// 默认构造器
// 如果结构体和类的所有属性都有默认值，同时没有自定义的构造器，那么swift会给这些结构体和类创建一个默认构造器。这个默认构造器将简单的创建一个所有属性值都设置为默认值的实例
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()


// 结构体的逐一成员构造器
// 如果结构体对所有存储属性提供了默认值且自身没有提供定制的构造器，它们能自动获得一个逐一成员构造器
struct Size {
    var width = 0.0, height = 0.0
}
// Size自动获得一个逐一成员构造器，可以利用这个逐一成员构造器来创建新的实例
let twoByTwo = Size(width: 2.0, height: 2.0)

var twoByOne = Size()
twoByOne.width = 2.0
twoByOne.height = 2.0

// 值类型的构造器代理
// 构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能减少多个构造器间的代码重复
// 构造器代理的实现规则和形式在值类型和类类型中有所不同。值类型（结构体和枚举类型）不支持继承，所以构造器代理的过程相对简单，因为它们只能代理给本身提供的构造器。类不同，它可以继承自其它类，这意味着类有责任保证其所有继承的存储型属性在构造时也能正确的初始化。


// 对于值类型，你可以使用self.init在自定义的构造器中引用其它的属于相同值类型的构造器。并且只能在构造器内部使用self.init

// 假如想通过默认构造器、逐一对象构造器以及你自己定制的构造器为值类型创建实例，建议将自己定制的构造器写到扩展中，而不是跟值类型定义混在一起。
struct Point {
    var x = 0.0 , y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin:Point,size:Size){
        self.origin = origin
        self.size = size
    }
    init(center:Point, size:Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY),size:size)
    }
}

// 第一个构造器
let basicRect = Rect()
// 第二个构造器
let originRect = Rect(origin: Point(x: 2.0, y: 4.0), size: Size(width: 3.0, height: 5.0))
// 第三个构造器
let centerRect = Rect(center: Point(x: 4.0, y: 6.0), size: Size(width: 1.0, height: 4.0))

















