//
//  CalculatorViewModel.swift
//  TechConsultingProject
//
//  Created by Uche Godfrey on 9/8/23.
//

import Foundation

enum Operation {
    case Addition
    case Mutiplication
    case Division
    case Subtraction
    case Default
}

class CalculatorViewModel{
    
    var curValue: Double = 0.0
    var result: Double = 0.0
    var firstNumber:Double = 0.0
    var  needsSecondNumber:Bool = false
    var operationType = Operation.Default
    init() {
    }
    
    
    func displayChar(char:String,display:@escaping (_ info:String)-> Void){
       
        if char.isNumeric {
            guard let num = Double(char) else{
                return
            }
            
            if(needsSecondNumber){
                result = executeOperations(operation: operationType, firstNumber: firstNumber, secondNumber: num)
                let temp = String(Int(result))
                //display(temp)
            }else{
                if curValue < 100000000000000000 {
                   curValue = (curValue * 10)
                }else{
                    curValue = 0
                }
                curValue = curValue + num
                let diplayValue = String(Int(curValue))
                display(diplayValue)
            }
            
        } else{
            switch(char){
            case "÷" :
                executeNonNumericButtonAction(needsSecondNumber: true,
                                              operation: Operation.Division){info in
                    if self.result == 0.0{
                        //display(String(Int(self.curValue)))
                    }else{
                        //display(String(Int(self.result)))
                    }
                }
                
            case "*" :
                executeNonNumericButtonAction(needsSecondNumber: true,
                                              operation: Operation.Mutiplication){info in
                    if self.result == 0.0{
                        //display(String(Int(self.curValue)))
                    }else{
                       // display(String(Int(self.result)))
                    }
            }
            
            case "-" :
                
                executeNonNumericButtonAction(needsSecondNumber: true,
                                              operation: Operation.Subtraction){info in
                    if self.result == 0.0{
                        //display(String(Int(self.curValue)))
                    }else{
                        //display(String(Int(self.result)))
                    }
                }
            case "=" :
                if result == 0.0 {
                    display(String(Int(curValue)))
                }
                else{
                        display(String(result))
                        }
            case "+" :
                executeNonNumericButtonAction(needsSecondNumber: true,
                                              operation: Operation.Addition){info in
                    if self.result == 0.0{
                        //display(String(Int(self.curValue)))
                    }else{
                        //display(String(Int(self.result)))
                    }
                }
            default:
                print("")
            }
        }
    }
    
    func executeOperations(operation:Operation,firstNumber:Double, secondNumber:Double) -> Double{
        switch operation {
            
        case .Addition: return (firstNumber + secondNumber)
        
        case  .Subtraction: return(firstNumber - secondNumber)
        
        case  .Mutiplication : return (firstNumber * secondNumber)
            
        case  .Division : return (firstNumber/secondNumber)
            
        default:
            return result
        }
        
    }
    func executeNonNumericButtonAction(needsSecondNumber:Bool,
                                       operation:Operation,showInfo:@escaping (_ info:String)->Void) {
         self.needsSecondNumber = needsSecondNumber
         self.firstNumber =  self.curValue
         self.operationType = operation
         showInfo(String(result))
     }
    func reset(showInfo:@escaping (_ info:String) -> Void ){
        
        self.curValue = 0
        result  = 0.0
        self.firstNumber  = 0.0
        self.needsSecondNumber = false
        let value = Int(curValue)
        showInfo(String(value))
        self.operationType = Operation.Default
        
    }
}

extension String {

    private static let numberFormatter = NumberFormatter()

    var isNumeric : Bool {
        Self.numberFormatter.number(from: self) != nil
    }
}
