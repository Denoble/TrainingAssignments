import UIKit

// Optionals

var fName: String = "Max"

var lName : String? = nil

var fullName: String = "\(fName) \(lName ?? "abc")"

print(fullName)

// Optiaonal Binding or Optional Unwrapping

// 1. if let
// 2. guard let
// 3. nil Coalsing   (??)



// If Let syntax

/*
if let newVariableName = optioanlVariableName {
    
    
}
*/

if let _lName = lName {
    print(_lName)
}

// Guard let Syntax

/*
 guard let newVaraibelName = optioanlVariable else {
 return
 }
 
 print(newVaraibelName)
 
 */



// Force Unwrapping


var marksType: String? = "Apple"

// marksType = nil  // when value is nil it will crash app so don't use this , this is dangerous

print(marksType!)


// Variables
// Explict and Implict Variables
// Type Safety
// Type Inference
// Optionals
// Optioanls binding using if let , nil coalsing
// Force unwrapping


