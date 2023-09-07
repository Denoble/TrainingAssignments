//
//  ViewController.swift
//  CountriesWithDelegate
//
//  Created by Uche Godfrey on 2023-09-05.
//

import UIKit

class ViewController: UIViewController,NetworkManagerActions{
    
    
    private var countries: [Country] = []
    private let networkManager = NetworkManager()
  
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    var filteredCountries = [Country]()
    var searching:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        networkManager.delegate  = self
        self.searchBar.delegate = self
        networkManager.getCountries()
    }

    
    
    func refresh(countries: [Country]) {
        self.countries = countries
        print(self.countries)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func refresh(countries: [Country]?, error: Error?) {
        guard let countries = countries else {
                print("\(String(describing: error?.localizedDescription))")
            return
        }
        self.countries = countries
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func populateView(cell:CountryTableViewCell,dataSource:[Country],index:Int){
        cell.country.text = dataSource[index].name
        cell.capital.text = dataSource[index].capital
        cell.currency.text = dataSource[index].currency.code
    }
    
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(!searching){
            return self.countries.count
        }else{
            return self.filteredCountries.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryTableViewCell ?? CountryTableViewCell()
        if(!searching){
            populateView(cell: cell, dataSource:self.countries, index: indexPath.row)
        }else{
            populateView(cell: cell, dataSource:self.filteredCountries, index: indexPath.row)
        }
        /*cell.country.text = self.countries[indexPath.item].name
        cell.capital.text = self.countries[indexPath.item].capital
        cell.currency.text = self.countries[indexPath.item].currency.code*/
        return cell
    }
}
extension ViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          
        if(searchText.isEmpty){
            filteredCountries = countries
        }else{
            filteredCountries = countries.filter{$0.name.contains(searchText)}
        }
        searching = true
        tableView.reloadData()
    }
}

