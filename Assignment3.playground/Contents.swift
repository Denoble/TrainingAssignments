import Darwin

//1 . Given an input array find 2nd maximum number from array

let input  =  [1,2,4,6,7,8,9,10,3,4,6]
// output =  9
var maxInt = Int.min
var secondMax = Int.min
for i in input {
    if(i > maxInt){
        secondMax = maxInt
        maxInt = i
    }
}
print(secondMax)


//2; given input array and and a target number , find the combination of 2 numbers whose sum is equal to target number


var input2 = [1,2,4,6, 0]  //
let target  = 5
input2.sort()
var right = input2.count-1
var left = 0
var num1:Int? = nil
var num2:Int? = nil
while(right  >= 0 && left  < input2.count){
    if((input2[left] + input2[right]) > target ){ right-=1}
    else if ((input2[left] + input2[right]) < target ){left+=1}
    else {
        if((input2[left] + input2[right]) == target ){
        num1 = input2[left]
        num2 = input2[right]
            break
    }
        
    }
}
 guard let num3 = num1 else {
    print("num1 is null")
     exit(0)
    
}
 guard let num4 = num2 else {
    print("num2 is null")
     exit(0)
}

print("Number combination is \(num3) and  \(num4)")
// output = [1,4]

// 3. Coding Challange PDF



