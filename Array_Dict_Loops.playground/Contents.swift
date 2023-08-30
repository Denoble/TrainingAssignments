import UIKit

var greeting = "Hello, playground"


var name = "a"

var name1 = "b"

var name2 = "c"

var name3 = "d"

var name4 = "e"

// Syntax

// var nameOfArray: [ TypeOfArray ]

var num1: Int = 5

var numbers: [Int?]? = [1,2,3,4, nil, 5]

var names = ["Apple", "Orange"]


names.append("Graps")
names.append("Graps")
names.append("Apple")

print(names)


// Dictionary

// Syntax

// var nameOfDict: [TypeOfKey : TypeOfValue]

var human:[String: String] = [:]

human["name"] = "Max"
human["age"] = "20"
human["name"] = "Alex"


print(human)


// Dict is unordered Collection of key value pairs
// Array is ordered collection of similler values


// Loops

// for in loop

//for value in arrayName {
//
//}

//for name in names {
//    print(name)
//}
//
//for value in 0..<100 {
//    print(value)
//}


// Set

var fruits: Set<String> = []

fruits.insert("Apple1")
fruits.insert("Banana1")
fruits.insert("Orange1")
fruits.insert("Orange1")
fruits.insert("Apple1")
fruits.insert("Graps1")

print(fruits)


// Set is unordered collection
// Set will not have duplicate values
