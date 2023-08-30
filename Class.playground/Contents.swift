import UIKit

var greeting = "Hello, playground"

protocol LaptopActions {
    func powerOn()
    func powerOff()
    func increaseVolume()
}

class Laptop: LaptopActions {
    func powerOn() {
        
    }
    
    func powerOff() {
        
    }
    
    func increaseVolume() {
        
    }
    
    
    
    var name: String = ""
    var storage: String = ""
    var ram: Int = 16
    var cpuType: String = ""
    var modelNumber: String = ""
    var seraialNumber: String = ""
    var color: String = ""

}

// Syntax to create Object
//let nameOfVariale = NameClass()

let lapTop1 = Laptop()
lapTop1.name = "MacBook Pro"

lapTop1.powerOn()

let lapTop2 = Laptop()
lapTop2.name = "M1 Macbook"

lapTop2.powerOn()


class Man {
    var name: String = ""
}

let m1 = Man()
m1.name = "Mathew"

let m2 = Man()
m2.name = "Mahesh"

let m3 = Man()
m3.name = "apple"



// Functions
// Protocols
// Classes
// How to create object of class
// how to confirm a class with protocol
