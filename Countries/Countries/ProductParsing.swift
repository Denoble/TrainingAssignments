//
//  ProductParsing.swift
//  Countries
//
//  Created by Uche Godfrey on 2023-09-01.
//

import Foundation
import UIKit

let path="https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"

let url = URL(string:path)
enum NetworkError: Error {
    case invalidResponse
}

struct ErrorResponse:Error, Decodable {
    let statusCode: Int
    let statusMessage: String
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}

// MARK: - Product
struct Product: Decodable {
    let productID, productName, shortDescription: String
    let price: Double
    let productImage: String
    let inStock: Bool?
    let reviewRating: Double?
    let reviewCount: Int?

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case productName, shortDescription, price, productImage, inStock, reviewRating, reviewCount
    }
}

typealias Products = [Product?]

// MARK: - Country
struct Country: Decodable {
    let capital, code: String
    let currency: Currency
    let flag: String
    let language: Language
    let name: String
    let region: Region
    let demonym: String?
}

// MARK: - Currency
struct Currency: Decodable {
    let code, name: String
    let symbol: String?
}

// MARK: - Language
struct Language: Decodable {
    let code: String?
    let name: String
    let iso6392, nativeName: String?

    enum CodingKeys: String, CodingKey {
        case code, name
        case iso6392 = "iso639_2"
        case nativeName
    }
}

enum Region: String, Decodable {
    case af = "AF"
    case americas = "Americas"
    case an = "AN"
    case empty = ""
    case eu = "EU"
    case na = "NA"
    case oc = "OC"
    case regionAS = "AS"
    case sa = "SA"
}

class CountryModel: Decodable{
   static var countries  = [Country]()
}
typealias Countries = [Country]




func fetchData(url:String) async throws -> Data {
    guard let url = URL(string: url) else {
        throw NSError(domain: "com.example.app", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
    }

    let (data, response) = try await URLSession.shared.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200 else {
        throw NetworkError.invalidResponse
    }

    return data
}

func save(url:String, toFilename filename: String)async throws -> Bool{
    var data:Data?
    do{
        try data = await fetchData(url: url)
    }catch{
        print(error)
    }
    guard let resonseData = data else{
        return false
    }
    var file: URL
    do {
        file = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent(filename)
        try data?.write(to: file)
        return true
    } catch {
        fatalError("Coudn't read or create \(filename): \(error.localizedDescription)")
    }
    
    return false
}

func readLocalFile() -> [Product]{
    var products = [Product]()
    guard let url = Bundle.main.url(forResource: "Products", withExtension: "json") else{return products}
    print(url)
    do{
        let data = try  Data(contentsOf: url)
        print("data is \(data)")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try  decoder.decode(Products.self, from: data)
        for tempResponse in response {
            if let tempProduct = tempResponse{
                products.append(tempProduct)
            }
        }
    }catch{
        print("This is \(error.localizedDescription)")
    }
    print(products)
    return products
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

class WebService{
class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else {
            DispatchQueue.main.async {
                completion(nil, error)
            }
            return
        }
        let decoder = JSONDecoder()
        do {
            let responseObject = try decoder.decode(ResponseType.self, from: data)
            DispatchQueue.main.async {
                completion(responseObject, nil)
            }
        } catch {
            do {
                let errorResponse = try decoder.decode(ErrorResponse.self, from: data) as Error
                DispatchQueue.main.async {
                    completion(nil, errorResponse)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
    }
    task.resume()
    
    return task
}
    class func getCountries(completion: @escaping ([Country], Error?) -> Void) {
        guard let _url = url else{return}
        taskForGETRequest(url: _url, responseType: Countries.self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion([], error)
            }
        }
    }
    
    class func downloadImage(path: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: path)else{return}
        print(url.path)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        task.resume()
    }
    
}
