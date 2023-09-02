//
//  ViewController.swift
//  Countries
//
//  Created by Uche Godfrey on 2023-09-01.
//

import UIKit

class ViewController: UIViewController {
    let url = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
    
    var countries  = [Country]()
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        products = readLocalFile()
        countries =  getCountries(url: url)
        print(" View did appear \(products)")
    }
}
func getCountries(url:String) -> [Country] {
    var countries = [Country]()
    
    guard let url = URL(string:url) else {
        return countries
    }
    var urlRequest =  URLRequest(url: url)
    
    urlRequest.httpMethod = "GET"
    
   let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    
    let dataTask =  urlSession.dataTask(with: urlRequest) { data, response, error in
        guard let data = data else { return }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response =  try? decoder.decode(Countries.self, from: data)
        guard let res = response else {
            return
        }
        
        for country in res {
            
            countries.append(country)
            
        }
        print(countries)
    
    }
    dataTask.resume()
    return countries
}

