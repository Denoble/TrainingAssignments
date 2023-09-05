//
//  ViewController.swift
//  CountriesWithDelegate
//
//  Created by Uche Godfrey on 2023-09-05.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,NetworkManagerActions {
    private var countries: [Country] = []
    private let networkManager = NetworkManager()
  
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        networkManager.delegate  = self
        networkManager.getCountries()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryTableViewCell ?? CountryTableViewCell()
        cell.country.text = self.countries[indexPath.item].name
        cell.capital.text = self.countries[indexPath.item].capital
        cell.currency.text = self.countries[indexPath.item].currency.code
        return cell
    }
    
    func refresh(countries: [Country]) {
        self.countries = countries
        print(self.countries)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

