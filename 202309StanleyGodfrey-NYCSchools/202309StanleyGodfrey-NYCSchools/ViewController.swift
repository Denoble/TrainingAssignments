//
//  ViewController.swift
//  202309StanleyGodfrey-NYCSchools
//
//  Created by Uche Godfrey on 9/10/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let viewModel = SchoolViewModel()
    var selectedIndex = 0
    var schooldbn = ""
    var schoolname = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navigateToSat" {
            let satViewController = segue.destination as! SatViewController
            //satViewController.name.text = viewModel.schools[selectedIndex].schoolName
        }
    }

}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getSchools(url: viewModel.url){schools,error in
            guard schools.count > 0 else{
                //Show error Alert
                return
            }
            self.viewModel.schools = schools
            self.tableView.reloadData()
        }
        let rows = self.viewModel.schools.count
        return self.viewModel.schools.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "schoolCell", for: indexPath) as? SchoolTableViewCell else{return UITableViewCell()}
        
        cell.name .text = viewModel.schools[indexPath.item].schoolName
        cell.location.text = viewModel.schools[indexPath.item].location
        cell.website.text =  viewModel.schools[indexPath.item].website
        cell.didDelete = {
            self.viewModel.schools.remove(at:indexPath.item)
            var tempSchool = self.viewModel.schools
            self.viewModel.schools = tempSchool
            self.tableView.reloadData()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        self.schooldbn = viewModel.schools[selectedIndex].dbn ?? ""
        self.schoolname = viewModel.schools[selectedIndex].schoolName ?? ""
        if let viewController = storyboard?.instantiateViewController(identifier: "satViewController") as? SatViewController {
            viewController.namePlaceHolder = self.schoolname
            viewController.dbnPlaceHolder = self.schooldbn
                
            navigationController?.pushViewController(viewController, animated: true)
            }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
