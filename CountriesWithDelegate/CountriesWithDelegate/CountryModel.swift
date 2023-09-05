//
//  CountryModel.swift
//  CountriesWithDelegate
//
//  Created by Uche Godfrey on 2023-09-05.
//

import Foundation

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


