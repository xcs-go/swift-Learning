//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 类型转换
// 类型转换 可以判断实例的类型，也可以将实例看做是父类或者子类的实例
// 类型转换在swift中使用is和as操作符实现。这两个操作符提供了一种简单的方式检查值的类型或者转换它的类型

// 定义一个类层次作为例子
// 将类型转换用在类和子类的层次结构上，检查特定类实例的类型并且转换这个类实例的类型成为这个层次结构中的其他类型

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director:String
    init(name:String, dirent:String) {
        self.director = dirent
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name:String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", dirent: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", dirent: "Orson Welles"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")

]

// 检查类型
// 用类型检查操作符is来检查一个实例是否属于特定子类型。若实例属于那个子类型，类型检查操作符返回true,否则返回false
var movieCount = 0
var songCount = 0
for item in library {
    if item is Movie {
        ++movieCount
    }else if item is Song {
        ++songCount
    }
}


// 向下转型
// 某类型的一个常量或变量可能在幕后实际上属于一个子类。当确定是这种情况时，可以尝试向下转到它的子类型，用类型转换操作符as?或as!
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir:\(movie.director)")
    } else if let song = item as? Song {
        print("Song:\(song.name), by:\(song.artist)")
    }
}

// Any 和AnyObject的类型转换
// swift为不确定类型提供了两种特殊类型别名
// AnyObject 可以代表任何class类型的实例
// Any 可以表示任何类型，包括方法类型

// AnyObject类型
// 当使用Cocoa APIs,我们一般会接收一个[AnyObject]类型的数组，或者说“一个任何对象类型的数组”。
let someObjects:[AnyObject] = [
    Movie(name: "2001: A Space Odyssey", dirent: "Stanley Kubrick"),
    Movie(name: "Moon", dirent: "Duncan Jones"),
    Movie(name: "Alien", dirent: "Ridley Scott")
]
for object in someObjects {
    let movie = object as! Movie
    print("\(movie.name),\(movie.director)")
}

for movie in someObjects as! [Movie] {
    print("Movie: \(movie.name),dir:\(movie.director)")
}

//Any 类型

var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0,5.0))
things.append(Movie(name: "Ghostbusters", dirent: "Ivan Reitman"))
things.append({(name:String) -> String in "hello, \(name)"})

for thing in things {
    switch thing {
    case 0 as Int:
        print("Zero as an Int")
    case 0 as Double:
        print("Zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x,y) as (Double,Double):
        print("an (x,y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name),dir: \(movie.director)")
    case let stringConverter as String -> String:
        print("stringConverter(Michael)")
    default:
        print("something else")
    }
}


















