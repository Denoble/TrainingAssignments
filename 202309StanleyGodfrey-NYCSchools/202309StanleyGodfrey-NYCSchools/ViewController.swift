//
//  ViewController.swift
//  202309StanleyGodfrey-NYCSchools
//
//  Created by Uche Godfrey on 9/10/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let networkManager =  NetworkManager()
    let urlStruct = UrlStruct()
    var viewModel:SchoolViewModel?
    var selectedIndex = 0
    var schooldbn = ""
    var schoolname = ""
  
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
      viewModel =  SchoolViewModel(networkManager: networkManager, urlStruct: urlStruct)
        guard let localViewModel = viewModel else{return}
        Task {
            await localViewModel.getSchools(url: localViewModel.url.schoolUrl)
            self.tableView.reloadData()
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navigateToSat" {
            let satViewController = segue.destination as! SatViewController
            //satViewController.name.text = viewModel.schools[selectedIndex].schoolName
        }
    }

}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)  -> Int {
        guard let localViewModel = viewModel else{ return 0}
        return localViewModel.schools.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "schoolCell", for: indexPath) as? SchoolTableViewCell else{return UITableViewCell()}
        guard let localViewModel = viewModel else{return UITableViewCell()}
            cell.name .text = localViewModel.schools[indexPath.item].schoolName
            cell.location.text = localViewModel.schools[indexPath.item].location
            cell.website.text =  localViewModel.schools[indexPath.item].website
            cell.didDelete = {
                localViewModel.schools.remove(at:indexPath.item)
                var tempSchool = localViewModel.schools
                localViewModel.schools = tempSchool
                self.tableView.reloadData()
            }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        guard let localViewModel = viewModel else{return}
        self.schooldbn = localViewModel.schools[selectedIndex].dbn ?? ""
        self.schoolname = localViewModel.schools[selectedIndex].schoolName ?? ""
        if let viewController = storyboard?.instantiateViewController(identifier: "satViewController") as? SatViewController {
            viewController.namePlaceHolder = self.schoolname
            viewController.dbnPlaceHolder = self.schooldbn
            
            navigationController?.pushViewController(viewController, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
            
        
    }
}
