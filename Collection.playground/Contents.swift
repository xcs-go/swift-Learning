//: Playground - noun: a place where people can play

// 集合类型:数组、集合、字典
// swift语言提供Arrays、Sets、Dictionaries三种基本的集合类型用来存储集合数据,数组是有序数据的集；集合（Sets）是无序无重复数据的集；字典是无序的健值对的集

import UIKit

var str = "Hello, playground"

// 集合的可变性: 如果在创建集合时并且将其分配成一个变量，那么这个集合将会是可变的，意味着我们可以在创建之后添加更多或者移除已经存在的数据项来改变集合的大小，如果将创建的集合分配成常量，那么它就是不可变的，其大小不能被改变
//1: 数组
// 数组使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置
// 数组的简单语法：写swift数组应该遵循像Array<Element>这样的形式，其中Element是这个数组中唯一允许存在的数据类型。也可以使用像[element]的简单语法。

// 创建一个空数组:可以使用构造语法来创建一个由特定数据类型构成的空数组
var someInts = [Int]()
print("\(someInts.count)")

// 如果代码上下文中已经提供了类型信息，就可以使用空数组语句创建一个空数组，语法: []
someInts.append(3)  // someInts包含一个int类型的值

someInts = []  // someInts数组仍然为空，但是仍然是[Int]类型

// 创建一个带有默认值的数组
// swift中的数组类型还可以提供特定大小并且所有数据都被默认的构造方法。我们可以把准备加入新数组的数据项数量和适当类型的初始值传入数组构造函数:
var threeDouble = [Double](count:3, repeatedValue:0.0)

// 通过两个数组相加创建一个新数组：相加的两个数组必须是相同的类型
var anotherThreeDoubles = Array(count:3, repeatedValue:2.5)

var sixDoubles = threeDouble + anotherThreeDoubles

// 用字面量构造数组:可以使用字面量来进行数组构造，这是一种用一个或者多个数组构造数组的简单方法，字面量是一系列由逗号分割并由方括号包含的值[value1,value2,value3]
var shoppingList:[String] = ["Eggs","Milk"];

// 访问和修改数组 : 通过数组的方法和属性来访问和修改数组，可以使用数组的只读属性count来获取数组中的数据项数量
print("\(shoppingList.count)")

// 使用布尔值属性isEmpty作为检查count属性的值是否为0
if shoppingList.isEmpty {
    print("the count is empty")
} else {
    print("the count is not empty")
}

// 也可以使用append(_:)方法在数组后面添加新的数据项
shoppingList.append("flour")

// 也可以使用＋＝直接在数组后面添加一个或多个拥有相同数据类型的数据项
shoppingList += ["baking Powder"]
//shoppingList += []

// 可以直接使用下标语法来获取数组中的数据项，把需要的数据项的索引值放在数组名称的方括号中
var firstItem = shoppingList[0]

// 我们也可以用下标来改变某个已有索引值对应的数据值
shoppingList[0] = "six eggs"

// 利用下标来一次改变一系列数据值，即使新数据和原数据的数量是不一样的。
//shoppingList[0..6] = ["0", "1", "2", "3", "4", "5", "6", ];
// 调用数组的insert(_:atIndex:)方法来在某个具体索引值来添加数据项
shoppingList.insert("maple", atIndex: 0)

// 调用removeAtIndex(_:)方法来移除数组中的某一项
let mapleSyrup = shoppingList.removeAtIndex(0)
firstItem = shoppingList[0]

// 移除最后的一项数据
let last = shoppingList.removeLast()


// 数组的遍历
for item in shoppingList {
    print(item)
}


// 如果需要每个数据项的值和索引值，可以使用enumerate()方法来进行数组遍历。enumerate()返回一个由每个数据项索引值和数据值组成的元组。可以把这个元组分解成临时常量或者变量来进行遍历
//for (index,value) in shoppingList.enumerate() {
//    print(<#value: T#>)
//}



// 集合
// 集合用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合。

// 集合类型的哈希值
// 一个类型为乐存储在集合中，该类型必须是可哈希化的，也就是说，该类型必须提供一个方法来计算它的哈希值，一个哈希值时Int类型的，相等的对象哈希值必须相同，如a==b,所以a.hashValue == b.hashValue


// swift中的set类型被写为set<Element>,这里的Element表示set中允许存储的类型，和数组不同的是，集合没有等价的简化形式

// 创建和构造一个空的集合(通过构造器语法)
var letters = Set<Character>()
print("\(letters.count)")
// 如果上下文提供了类型信息，可以通过一个空的数组字面量创建一个空的Set
letters.insert("a")
letters = []  // 此时的集合为空，但是还是Set<Character>类型

// 用数组字面量创建集合
// 使用数组字面量来构造集合，并且可以使用简化形式写一个或者多个值作为集合元素
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop",]

// 访问和修改一个集合
// 1:计算集合中的数量:用count属性
print("\(favoriteGenres.count)")

//2:使用isEmpty作为一个缩写形式去检查count属性是否为0
if favoriteGenres.isEmpty {
    print("0")
} else {
    print("1")
}

//3:利用insert方法来添加一个新元素
favoriteGenres.insert("Jazz")

//4：利用remove方法来删除一个元素
favoriteGenres.remove("Rock")

// 5:利用removeAll来删除所有的元素
//favoriteGenres.removeAll(keepCapacity: true)
//print("\(favoriteGenres.count)")

// 6:利用contains方法来检查Set中是否包含一个特定的值
if favoriteGenres.contains("FUNK") {
    print("0")
} else {
    print("1")
}

// 7:遍历一个集合
// 利用forin循环便利一个Set中的所有值
for ge in favoriteGenres {
    print("\(ge)")
}

// 8:按照一定顺序来遍历一个Set中的值用sort方法

//for ge in favoriteGenres.sort() {
//
//}


// 集合操作
// 1:使用intersect()方法根据两个集合中都包含的值创建一个新的集合
// 2:使用exclusiveor()方法根据在一个集合中但不在两个集合中的值创建一个新的集合
//3:使用union（）方法根据两个集合的值创建一个新的集合
//4:使用subtract()方法根据不再该集合中的值创建一个新的集合

let oddDigits: Set = [1, 3, 5, 7 ,9]
let evenDigits:Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers:Set = [2, 3, 5, 7]

// 将两个集合中的值合并成为一个新的集合
oddDigits.union(evenDigits)

// 将两个集合都拥有的值组成一个新的集合
oddDigits.intersect(evenDigits)

// 将oddDigits集合中的值不在singleDigitPrimeNumbers集合中的值组成一个新的集合
oddDigits.subtract(singleDigitPrimeNumbers)

// 将两个集合中不相同的值组成一个新的集合
oddDigits.exclusiveOr(singleDigitPrimeNumbers)


// 使用“是否相等”运算符（==）来判断两个集合是否包含全部相同的值
// 使用isSubsetOf()方法来判断一个集合中的值是否也包含在另一个集合中
// 使用isSupersetOf()方法来判断一个集合中包含另一个集合中所有的值
// 使用isStrictSubsetOf()或者isStrictSupersetOf()方法来判断一个集合是否是另一个集合的子集合或者父集合并且两个集合并不相等
// 使用isDisjointWith()方法来判断两个集合是否不含有相同的值
let houseAnimals:Set = ["?", "?"]
let farmAnimals:Set = ["?", "?", "?", "?", "?"]
let cityAnimals:Set = ["?", "?"]
houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isSupersetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals)


// 字典
// 字典使用Dictionary<Key,Value>定义，其中Key是字典中健的数据类型，value是字典中对应于这些健所存储值的数据类型

// 我们也可以用[key:value]的快捷形式去创建一个字典类型
// 创建空字典
var namesOfIntegers = [Int:String]()
var name1 = [Int]() // 创建一个数组

// 如果上下问提供了字典的类型，可以使用[:]老创建一个空字典
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

// 用字典字面量创建字典
var airports:[String:String] = ["yyy":"ssh", "hdjd":"ueb"]

// 访问和修改字典
//1: li 用count属性来获取字典的数据项数量
print("\(airports.count)")
//2: 使用isEmpty来快速的检查字典的count属性是否等于0
if airports.isEmpty {
    print("0")
} else {
    print("1")
}

// 在字典中使用下标语法来添加新的数据项。
airports["LHR"] = "London"
// 也可以使用下标语法来修改特定健值对的值
airports["LHR"] = "GHFJUD"
print("\(airports)")


// 字典的updateValue(_:forkey:)方法可以设置或者更新特定健对应的值。updateValue方法在这个健不存在对应值的时候会设置新值或者在存在时更新已经存在的值，updateValue方法返回更新前的原值
// updateValue方法会返回对应值的类型的可选值,如果有值存在于更新前，则这个可选值包含了旧值,否则它将会是nil
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("1")
}
if let airportName = airports["DUB"] {
    print("1")
} else {
    print("0")
}

// 从字典中移除健值对的方法,通过设置键的值为nil来移除健值对
airports["DUB"] = nil
print("\(airports)")

// 通过removevalueforkey()方法也可以用来在字典中移除健值对
if let removedValue = airports.removeValueForKey("DUB") {
    print("1")
} else {
    print("0")
}


// 字典遍历
// 使用for-in循环来遍历某个字典中的健值对。每个字典中的数据项都以ley,value元组形式返回
for (airportCode, airportName) in airports {
    print("\(airportCode):\(airportName)")
}

// 通过keys或者value属性，遍历字典的键或者值
for airportCode in airports.keys {
    print("\(airportCode)")
}

// 如果只是需要使用字典的key集合或者是value集合来作为某个接受数组的API的参数。可以直接使用keys或者values属性来构造一个新数组
let airportCode = [String](airports.keys)




