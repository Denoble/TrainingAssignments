//
//  SatViewController.swift
//  202309StanleyGodfrey-NYCSchools
//
//  Created by Uche Godfrey on 9/10/23.
//

import UIKit

class SatViewController: UIViewController {
    @IBOutlet weak var satAvgScore: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var numofSatTestTaken: UILabel!
    
    @IBOutlet weak var satAvgWritingScore: UILabel!
    @IBOutlet weak var mathAvgScore: UILabel!
    @IBOutlet weak var critialReadingAvgScore: UILabel!
    @IBOutlet weak var testTakerNum: UILabel!
    let viewModel = SchoolViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
