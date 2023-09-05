//
//  ViewController.swift
//  Countries
//
//  Created by Uche Godfrey on 2023-09-01.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
   
    @IBOutlet var tableview: UITableView!
    //let products = readLocalFile()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableview.dataSource = self
        WebService.getCountries{ countries,error in
            CountryModel.countries = countries
            self.tableview.reloadData()
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return CountryModel.countries.count
     
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryTableViewCell ?? CountryTableViewCell()
        let path = CountryModel.countries[indexPath.item].flag
        let url = URL(string:path)
        cell.country.text = CountryModel.countries[indexPath.item].name
        cell.capital.text = CountryModel.countries[indexPath.item].capital
        cell.currency.text =  CountryModel.countries[indexPath.item].currency.code
        
        return cell
    }
}
