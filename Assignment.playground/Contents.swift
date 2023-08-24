import UIKit

// Due Date : 24/08

// Interview Questions (Theory)

// 1. how to create mutalbe and immutable types in Swift
// Mutable types are created using keyword var while immutable types are created using keyword let
    
// 2. what is Type Safety
/*Swift enforces that a property or variable/constant conforms to one of its data type or an error is thrown during compile time*/


// 3. What is they Inference
/*/
    The ability of Swift compiler to detect and assigned the right data type to implicitly declared variable/constant or property.
 */
// 4. How to create explict and implict variables
/*
   var name = "James"
   var name1:String = "James"
 */
// 5. What is Optionals
/**
    Optionals are variables that can have null value
 */
// 6. how to do optioanl binding
/*
 Optional binding is a way to find out if optional type value is not null (nil).And then use the non_null value or
 either inform the value is nil/null or assign a default value to the optional type.
 Using if let,  guard let or nil coalescing
 */
// 7. Diff b/w if let and guard let
/*
  if let is used for optional binding in this manner  "if let non-nil = optionalType{ print(non-nil)}
 guard let is used in the manner "guard let non-nil =optionalType{
    exit execution of the current function
 }
 print(non-nil)
 
*/
// 8 . What is nil coalsing operator
/*
   nil coalecsing is used to unwrap optional type by assigning a default value to the type should the type value is null.
 */


// 9. what is protocol
/*
 Set of rules  classes and structs implementing the protocol must adhere to.
 */
// 10. What is class
/*
  Class is the encapsulation of the definition of an object, including its properties and functonality in a unit block of code
 */
// 11. Diff b/w Struct and Class
 /*class objects are reference type,  2 instances of same object of a class point to same memory stored in the heap while struct objects are value type, 2 instances of a struct point to 2 different locations in the stack memory

  */

// 12. Diff b/w array , dict  Set
/**
    Array is a data structure / a collection used to stored data in ordered manner
    Dictionary is a data structure /a collection used to store data in key -value manner
     Set is a data structure  that does not allow duplicate element
 */



// Codign Questoins

//1 remvoe duplicate chars from a String
    // input : "aabbccdd" : output : abcd
   let input = "aabbccdd"
   var output = ""
  var set = Set<Character>()
for char in  input{
    if(!set.contains(char)){
        set.insert(char)
        output.append(char)
    }
}
print(output)
  

// 2. remove duplidate elemetn from an array
    
    // input : [1,2,2,3,4,7,5,5]
    // output = [1,2,3,4,7]
 let inputArray =  [1,2,2,3,4,7,5,5]
var outputArray:[Int] = []
var arraySet = Set<Int>()
for i in  inputArray{
    if(!arraySet.contains(i)){
        arraySet.insert(i)
        outputArray.append(i)
    }
}
print(outputArray)

// 3. Create a class of Student with 4 attributes and 3 actions
class Student{
    let name:String
    let id:Int
    let department:String
    let faculty:String
    init(_name:String,_id:Int,_department:String,_faculty:String){
       name =  _name
       id =  _id
       department = _department
        faculty = _faculty
    }
    func registereCourse(id:String){
        
    }
    func withdrawCourse(id:String){}
    func viewGrades(id:String){}
}

// 4. create array of 10 students objects and iterate through array and print all each student name
var students:[Student] = []
for i in 0 ... 9{
    let temp = Student(_name: "student \(i)", _id: i,
                       _department: "computer science", _faculty:"science")
    students.append(temp)
}
for std in students{
    print(std.name)
}

// 5. Create Optional variable and show use of optional binding.
var street:String? = nil
print( street ?? "Manhanttan")



