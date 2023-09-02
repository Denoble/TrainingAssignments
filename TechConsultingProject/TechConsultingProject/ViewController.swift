//
//  ViewController.swift
//  TechConsultingProject
//
//  Created by Uche Godfrey on 2023-08-24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var name: UITextField!
    let admin = "Admin"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToCalculator(_ sender: Any) {
        performSegue(withIdentifier: "toCalculator", sender: self)
    }
    
    @IBAction func onLoginButtonClicked(_ sender: Any) {
        if name.text == admin && password.text == admin {
            performSegue(withIdentifier: "toTableView", sender: self)
        }
    }
}

