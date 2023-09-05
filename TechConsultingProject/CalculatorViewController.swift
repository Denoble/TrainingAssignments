//
//  CalculatorViewController.swift
//  TechConsultingProject
//
//  Created by Uche Godfrey on 2023-08-29.
//

import UIKit

class CalculatorViewController: UIViewController {


    @IBOutlet weak var display: UILabel!
    var curValue: Int64 = 0
    var isDouble = false
    var result: Int64 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        isDouble = false

        // Do any additional setup after loading the view.
    }
    @IBAction func buttonNumberSignOnclick(_ sender: Any) {
       // displayChar(char: "+/-")
    }
    
    @IBAction func buttonCancelOnclick(_ sender: Any) {
        display.text = "0"
        curValue = 0
        result = 0
    }
    
    @IBAction func buttonDivisionOnclick(_ sender: Any) {
        displayChar(char: "÷")
    }
    @IBAction func buttonPercentageOnclick(_ sender: Any) {
        displayChar(char: "%")
    }
    @IBAction func button7Onclick(_ sender: Any) {
        displayChar(char: "7")
    }
    @IBAction func button8Onclick(_ sender: Any) {
        displayChar(char: "8")
    }
    @IBAction func button9Onclick(_ sender: Any) {
        displayChar(char: "9")
    }
    @IBAction func buttonMutipleOnclick(_ sender: Any) {
        displayChar(char: "*")
    }
    @IBAction func button5Onclick(_ sender: Any) {
        displayChar(char: "5")
    }
    @IBAction func buttonMinusOnclick(_ sender: Any) {
        displayChar(char: "-")
    }
    @IBAction func button6Onclick(_ sender: Any) {
        displayChar(char: "6")
    }
    @IBAction func button1Onclick(_ sender: Any) {
        displayChar(char: "1")
    }
    @IBAction func button4Onclick(_ sender: Any) {
        displayChar(char: "4")
    }
    @IBAction func buttonEqualsOnclick(_ sender: Any) {
        displayChar(char: "=")
    }
    
    @IBAction func button3Onclick(_ sender: Any) {
        displayChar(char: "3")
    }
    @IBAction func button2Onclick(_ sender: Any) {
        displayChar(char: "2")
    }
    @IBAction func buttonPeriodOnclick(_ sender: Any) {
        isDouble = !isDouble
    }
    @IBAction func button0Onclick(_ sender: Any) {
        displayChar(char: "0")
    }
    @IBAction func buttonPlusOnclick(_ sender: Any) {
        displayChar(char: "+")
    }
    
    func displayCurrentValue(cur:Int64) {
        display.text = String(cur)
    }
    
    func displayChar(char:Character){
        if char.isNumber {
            
                if curValue < 100000000000000000 {
                   curValue = (curValue * 10)
                }else{
                    curValue = 0
                }
            let num =  Int(String(char))
            curValue = curValue + Int64(((num ?? 0)))
            displayCurrentValue(cur: curValue)
            
        } else{
            switch(char){
            case "÷" :
                if(result == 0){
                    result = curValue
                    curValue = 0
                }
                else{
                    result =  result/curValue
                    curValue = 0
                }
                displayCurrentValue(cur: result)
                
            case "%" :
                if(result == 0){
                    result = curValue
                }
                else{
                    result =  ((result/100)*curValue)
                }
                curValue = 0
                displayCurrentValue(cur: result)
            case "*" :
                if(result == 0){
                    result = curValue
                }
                else{
                    result =  result*curValue
                }
                curValue = 0
                displayCurrentValue(cur: result)
            
            case "-" :
                
                if(result == 0){
                    result = curValue
                }
                else{
                    result =  result-curValue
                }
                curValue = 0
                displayCurrentValue(cur: result)
            case "=" :
                displayCurrentValue(cur: result)
                result = 0
            case "+" :
                if(result == 0){
                    result = curValue
                }
                else{
                    result =  result+curValue
                }
                curValue = 0
                displayCurrentValue(cur: result)
                
            default:
                print("")
            }
            
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
