//
//  CalculatorViewController.swift
//  TechConsultingProject
//
//  Created by Uche Godfrey on 2023-08-29.
//

import UIKit

class CalculatorViewController: UIViewController {


    @IBOutlet weak var displayLabel: UILabel!
    var viewModel = CalculatorViewModel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonNumberSignOnclick(_ sender: Any) {
       // displayChar(char: "+/-")
    }
    
    @IBAction func buttonCancelOnclick(_ sender: Any) {
      
        viewModel.reset(){info in
            self.displayLabel.text = "0"
        }
    }
    
    @IBAction func buttonDivisionOnclick(_ sender: Any) {
        displayCurrentValue(cur: "÷")
    }
    @IBAction func buttonPercentageOnclick(_ sender: Any) {
    
        displayCurrentValue(cur: "%")
    }
    @IBAction func button7Onclick(_ sender: Any) {
        displayCurrentValue(cur: "7")
    }
    @IBAction func button8Onclick(_ sender: Any) {
        displayCurrentValue(cur: "8")
    }
    @IBAction func button9Onclick(_ sender: Any) {
        displayCurrentValue(cur: "9")
    }
    @IBAction func buttonMutipleOnclick(_ sender: Any) {
        displayCurrentValue(cur: "*")
    }
    @IBAction func button5Onclick(_ sender: Any) {
        displayCurrentValue(cur: "5")
    }
    @IBAction func buttonMinusOnclick(_ sender: Any) {
        displayCurrentValue(cur: "-")
    }
    @IBAction func button6Onclick(_ sender: Any) {
        displayCurrentValue(cur: "6")
    }
    @IBAction func button1Onclick(_ sender: Any) {
        displayCurrentValue(cur: "1")
    }
    @IBAction func button4Onclick(_ sender: Any) {
        displayCurrentValue(cur: "4")
    }
    @IBAction func buttonEqualsOnclick(_ sender: Any) {
        displayCurrentValue(cur: "=")
    }
    
    @IBAction func button3Onclick(_ sender: Any) {
        displayCurrentValue(cur: "3")
    }
    @IBAction func button2Onclick(_ sender: Any) {
        displayCurrentValue(cur: "2")
    }
    @IBAction func buttonPeriodOnclick(_ sender: Any) {
       
    }
    @IBAction func button0Onclick(_ sender: Any) {
        displayCurrentValue(cur: "0")
    }
    @IBAction func buttonPlusOnclick(_ sender: Any) {
        displayCurrentValue(cur: "+")
    }
    
    func displayCurrentValue(cur:String) {
        viewModel.displayChar(char: cur){ result in
            self.displayLabel.text = String(result)
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
