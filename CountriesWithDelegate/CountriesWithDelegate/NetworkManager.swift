//
//  NetworkManager.swift
//  CountriesWithDelegate
//
//  Created by Uche Godfrey on 2023-09-05.
//

import Foundation

protocol NetworkManagerActions {
    func refresh(countries: [Country]?,error:Error?)
}
guard let url = URL(string: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") else {
    return
}

class NetworkManager{
    var delegate: NetworkManagerActions?
    func getCountries<T>(url:URL) {
      let request = URLRequest(url: url)
      let urlSession =   URLSession.shared
       let sessionTask =  urlSession.dataTask(with: request) { data, response, error in
           
           
           guard let data = data else {
               return
           }
           
           let jsonDecoder = JSONDecoder()
           
           do {
              let  countries =  try  jsonDecoder.decode([Country].self, from: data)
               
              // print(countries)
               self.delegate?.refresh(countries: countries,error: nil)
           }catch {
               self.delegate?.refresh(countries: nil, error:error)
           }
        }
        sessionTask.resume()
    }
}
