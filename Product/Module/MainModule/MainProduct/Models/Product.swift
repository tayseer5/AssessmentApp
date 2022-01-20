//
//  Product.swift
//  AssessmentApp
//
//  Created by Irfan Saeed on 19/01/2022.
//

import Foundation
import Realm
import RealmSwift

struct ProductResponse : Codable{
    var products: [String:Product]
    
}
class Product: Object, Codable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var barcode: String
    @Persisted var productDescription: String
    @Persisted var imageUrl: String
    @Persisted var name: String
    @Persisted var retailPrice: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case barcode
        case productDescription = "description"
        case imageUrl = "image_url"
        case name
        case retailPrice = "retail_price"
    }
}
