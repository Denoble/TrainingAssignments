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
    let  networkManager = NetworkManager()
    let urlStruct =  UrlStruct()
    var viewModel : SchoolViewModel?
    @IBOutlet weak var writingAveScore: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.schoolName.text = self.dbnPlaceHolder
        self.schoolName.text = self.namePlaceHolder
        viewModel = SchoolViewModel(networkManager: networkManager,urlStruct: urlStruct)
        guard let localViewModel = viewModel else {
            return
        }
        Task{
                await fetchSchoolSats(localViewModel.schoolSats)
            }
        

        // Do any additional setup after loading the view.
    }
    func updateUI(satData:SchoolSat?){
        
      //  satAvgScore.text = satData?.satMathAvgScore
        self.writingAveScore.text = satData?.satWritingAvgScore
        self.numOfTestTaker.text = satData?.numOfSatTestTakers
        self.criticalAveScore.text = satData?.satCriticalReadingAvgScore
        self.mathAverage.text = satData?.satMathAvgScore
    }
    private func fetchSchoolSats(_ sats:[SchoolSat]) async {
        guard let localViewModel = viewModel else{return}
        do{
            try await localViewModel.getSats(url: localViewModel.url.satUrl)
            let sat = localViewModel.getSat(dbn: self.dbnPlaceHolder)
            DispatchQueue.main.async{
                self.updateUI(satData: sat)
                print(localViewModel.schoolSats)
                
            }
        }catch{
            print(error.localizedDescription)
        }
        print(dbnPlaceHolder)
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
