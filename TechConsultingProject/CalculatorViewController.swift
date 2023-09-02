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
    var numberCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        isDouble = false

        // Do any additional setup after loading the view.
    }
    @IBAction func buttonNumberSignOnclick(_ sender: Any) {
    }
    
    @IBAction func buttonCancelOnclick(_ sender: Any) {
        display.text = "0"
        curValue = 0
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
    
    func displayChar(char:Character){
        if char.isNumber {
            do{
                if curValue < 100000000000000000 {
                    try  curValue = (curValue * 10)
                }else{
                    curValue = 0
                }
            
            }catch{
                print("\(error.localizedDescription)")
            }
            let num =  Int(String(char))
            curValue = curValue + Int64(((num ?? 0)))
            display.text = String(curValue)
            
        } else{
            
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
