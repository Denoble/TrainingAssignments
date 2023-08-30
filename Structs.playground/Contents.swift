import UIKit

var greeting = "Hello, playground"

protocol HumanActions {
    func walk()
}

struct Human: HumanActions {
    
    var name: String = ""
    var age: Int = 0
    
    func add() {
        
    }
    func walk() {
        
    }
}

var h1 = Human()
h1.name = "Mahesh"
h1.age = 25
h1.add()

var h2 = h1
h2.name = "Raj"

print(h1.name)
print(h2.name)

class Employee {
    var name: String = ""
    var age: Int = 0
}

let e1 = Employee()
e1.name = "Malik"

let e2 = e1

e2.name = "Mahesh"


print(e1.name)
print(e2.name)


// Refrence Type and Value Type


// Refrence Type : classes

// Value Type : Stuct


// Heap Memory : Classes are stored in heap memory

// Stack Memory : Structs are stored in stack memory
