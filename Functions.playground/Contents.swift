
import UIKit

var greeting = "Hello, playground"


// Syntax

 // without any parameter and return type

// func nameOfFunction() {}



// func nameOfFunction(paramName: paramType, ..)-> returnType {}

func hello() {
   print("Hello Function")
}

hello()
// Function Declaration
// Function Body
// Function call



// with any parameter and return type

func add(num1: Int, num2: Int) -> Int {
  return num1 + num2
}

let sum = add(num1: 5, num2: 6)

print(sum)


func getFullName(fName: String, middleName: String?, lName: String?) -> String {
    
    
    return fName + " " + (middleName ?? "") + " " + (lName ?? "")
    
}

let fullName = getFullName(fName: "Alex", middleName: nil, lName:"lawarance")


print(fullName)



