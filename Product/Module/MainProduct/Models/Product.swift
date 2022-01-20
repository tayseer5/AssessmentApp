//
//  Product.swift
//  AssessmentApp
//
//  Created by Irfan Saeed on 19/01/2022.
//

import Foundation

struct ProductResponse : Codable{
    var products: [String:Product]
    
}
struct Product: Codable {
    var id: String
    var barcode: String
    var productDescription: String
    var imageUrl: String
    var name: String
    var retailPrice: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case barcode
        case productDescription = "description"
        case imageUrl = "image_url"
        case name
        case retailPrice = "retail_price"
    }
}
