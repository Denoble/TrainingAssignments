//
//  ProductParsing.swift
//  Countries
//
//  Created by Uche Godfrey on 2023-09-01.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
}

// MARK: - WelcomeClass
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

/*struct ExampleJson2KtSwift: Codable {

  var productId        : String? = nil
  var productName      : String? = nil
  var shortDescription : String? = nil
  var price            : Double? = nil
  var productImage     : String? = nil
  var inStock          : Bool?   = nil

  enum CodingKeys: String, CodingKey {

    case productId        = "productId"
    case productName      = "productName"
    case shortDescription = "shortDescription"
    case price            = "price"
    case productImage     = "productImage"
    case inStock          = "inStock"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    productId        = try values.decodeIfPresent(String.self , forKey: .productId        )
    productName      = try values.decodeIfPresent(String.self , forKey: .productName      )
    shortDescription = try values.decodeIfPresent(String.self , forKey: .shortDescription )
    price            = try values.decodeIfPresent(Double.self , forKey: .price            )
    productImage     = try values.decodeIfPresent(String.self , forKey: .productImage     )
    inStock          = try values.decodeIfPresent(Bool.self   , forKey: .inStock          )
 
  }

  init() {

  }

}*/


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
