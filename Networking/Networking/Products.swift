//
//  Products.swift
//  Networking
//
//  Created by Uche Godfrey on 2023-08-30.
//

import Foundation
import Foundation
struct Response:Decodable{
    let products: [Product]
}


struct Product: Decodable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}


