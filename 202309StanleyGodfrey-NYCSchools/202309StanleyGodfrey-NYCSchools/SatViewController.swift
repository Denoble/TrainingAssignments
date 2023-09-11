//
//  SatViewController.swift
//  202309StanleyGodfrey-NYCSchools
//
//  Created by Uche Godfrey on 9/10/23.
//

import UIKit

class SatViewController: UIViewController {
    var dbnPlaceHolder = ""
   var  namePlaceHolder = ""
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var numOfTestTaker: UILabel!
    @IBOutlet weak var mathAverage: UILabel!
    
    @IBOutlet weak var criticalAveScore: UILabel!
    let viewModel = SchoolViewModel()
    @IBOutlet weak var writingAveScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.schoolName.text = self.dbnPlaceHolder
        self.schoolName.text = self.namePlaceHolder
        viewModel.getSats(url: viewModel.satUrl){ schoolSats,error in
            self.viewModel.schoolSats = schoolSats
            let sat = self.viewModel.getSat(dbn: self.dbnPlaceHolder)
            print(sat)
            DispatchQueue.main.async{
                self.populateControls(satData: sat)
            }
        }
        print(dbnPlaceHolder)
        

        // Do any additional setup after loading the view.
    }
    func populateControls(satData:SchoolSat?){
        
      //  satAvgScore.text = satData?.satMathAvgScore
        self.writingAveScore.text = satData?.satWritingAvgScore
        self.numOfTestTaker.text = satData?.numOfSatTestTakers
        self.criticalAveScore.text = satData?.satCriticalReadingAvgScore
        self.mathAverage.text = satData?.satMathAvgScore
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
