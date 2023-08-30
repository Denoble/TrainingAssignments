//
//  CalculatorViewController.swift
//  TechConsultingProject
//
//  Created by Uche Godfrey on 2023-08-29.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var buttonDivision: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var display: UILabel!
    var curValue:Int64 = 0
    var isDouble = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func buttonNumberSignOnclick(_ sender: Any) {
    }
    
    @IBAction func buttonCancelOnclick(_ sender: Any) {
        display.text = "0"
    }
    
    @IBAction func buttonDivisionOnclick(_ sender: Any) {
    }
    @IBAction func buttonPercentageOnclick(_ sender: Any) {
    }
    @IBAction func button7Onclick(_ sender: Any) {
    }
    @IBAction func button8Onclick(_ sender: Any) {
    }
    @IBAction func button9Onclick(_ sender: Any) {
    }
    @IBAction func buttonMutipleOnclick(_ sender: Any) {
    }
    @IBAction func button5Onclick(_ sender: Any) {
    }
    @IBAction func buttonMinusOnclick(_ sender: Any) {
    }
    @IBAction func button6Onclick(_ sender: Any) {
    }
    @IBAction func button1Onclick(_ sender: Any) {
    }
    @IBAction func button4Onclick(_ sender: Any) {
    }
    @IBAction func buttonEqualsOnclick(_ sender: Any) {
    }
    @IBAction func button2Onclick(_ sender: Any) {
    }
    @IBAction func button3Onclick(_ sender: Any) {
    }
    @IBAction func buttonPeriodOnclick(_ sender: Any) {
        isDouble = !isDouble
    }
    @IBAction func button0Onclick(_ sender: Any) {
    }
    @IBAction func buttonPlusOnclick(_ sender: Any) {
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
